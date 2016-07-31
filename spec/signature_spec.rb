require "spec_helper"

describe Khipu::Signature do
  # This test basically replicates the implementation
  # but isolating the HMAC signature
  # in its own class
  # allows us to test that ApiClient
  # is using it correctly
  subject {
    described_class.new(
      :post,
      "https://khipu.com/api/2.0/bar/foo",
      {"a" => 1, "b" => "should be encoded"}
    )
  }

  describe "#to_sign" do
    it "is an encoded string, in the right order" do
      expect(subject.to_sign).to eq "POST&https%3A%2F%2Fkhipu.com%2Fapi%2F2.0%2Fbar%2Ffoo&a=1&b=should%20be%20encoded"
    end
  end

  describe "#encoded" do
    it "" do
      expect(subject.encoded).to eq({"a" => "1", "b" => "should%20be%20encoded"})
    end
  end

  describe "#sign!(secret)" do
    # https://khipu.com/page/api-firma-requerimientos
    it "generates HMAC signature with encoded params" do
      digest = double("digest")
      allow(OpenSSL::Digest).to receive(:new).with("sha256").and_return digest
      expect(OpenSSL::HMAC).to receive(:hexdigest).with(
        digest,
        "secretabc",
        subject.to_sign
      ).and_return "signature-here"

      expect(subject.sign!("secretabc")).to eq "signature-here"
    end
  end
end
