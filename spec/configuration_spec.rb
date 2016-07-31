require "spec_helper"

describe Khipu::Configuration do
  subject { described_class.new }

  describe "defaults" do
    it "#scheme" do
      expect(subject.scheme).to eq "https"
    end

    it "#host" do
      expect(subject.host).to eq "khipu.com"
    end

    it "#base_path" do
      expect(subject.base_path).to eq "/api/2.0"
    end

    it "#base_url" do
      expect(subject.base_url).to eq "https://khipu.com/api/2.0"
    end

    it "#verify_ssl" do
      expect(subject.verify_ssl).to be true
    end

    it "#cert_file" do
      expect(subject.cert_file).to be nil
    end

    it "#key_file" do
      expect(subject.key_file).to be nil
    end

    it "#ssl_ca_cert" do
      expect(subject.ssl_ca_cert).to be nil
    end

    it "#debugging" do
      expect(subject.debugging).to be false
    end

    it "#secret" do
      expect(subject.secret).to be nil
    end

    it "#receiver_id" do
      expect(subject.secret).to be nil
    end
  end

  describe "#api_client" do
    it "instantiates client with self" do
      c = double("Khipu::ApiClient")
      expect(Khipu::ApiClient).to receive(:new).with(subject).and_return c

      expect(subject.api_client).to eq c
    end
  end
end
