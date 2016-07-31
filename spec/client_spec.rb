require "spec_helper"

describe Khipu::ApiClient do
  let(:body_data) {
    {
      message: "A message"
    }
  }

  let(:response_body) {
    JSON.dump(
      body_data
    )
  }

  let(:http_response) {
    double("HTTP response",
      success?: true,
      code: 200,
      headers: {},
      body: response_body,
      status_message: "Ok"
    )
  }

  let(:http_request) {
    double("HTTP request",
      run: http_response
    )
  }

  subject { described_class.new }

  before do
    allow(Typhoeus::Request).to receive(:new).and_return http_request
  end

  def assert_api_call(url:, method: :post, ua: /ACME/)
    expect(Typhoeus::Request).to receive(:new) do |u, opts|
      expect(u).to eq url
      expect(opts[:method]).to eq method
      opts[:headers].tap do |h|
        expect(h["User-Agent"]).to match(ua)
      end
    end.and_return http_request
  end

  context "global configuration" do
    before do
      Khipu.configure do  |c|
        c.secret           = 'abc123'
        c.receiver_id      = 1234
        c.platform         = 'ACME'
        c.platform_version = '1.0'
      end
    end

    it "calls API with global configuration" do
      assert_api_call url: "https://khipu.com/api/2.0/foo/bar", method: :post
      subject.call_api('post', '/foo/bar')
    end

    context "return types" do
      let(:resp) { subject.call_api('post', '/foo/bar', return_type: return_type) }

      describe "SuccessResponse" do
        let(:return_type) { "SuccessResponse" }

        it "returns expected response" do
          expect(resp).to be_a Khipu::SuccessResponse
          expect(resp.message).to eq "A message"
        end
      end

      describe "BankItem" do
        let(:return_type) { "BankItem" }
        let(:body_data) {
          {
            bank_id: 123,
            name: "ACME bank",
            message: "Bank message",
            min_amount: 10.0,
            type: "commercial",
            parent: "ACME INC"
          }
        }

        it "returns expected response" do
          expect(resp).to be_a Khipu::BankItem
          expect(resp.bank_id).to eq "123"
          expect(resp.name).to eq "ACME bank"
          expect(resp.message).to eq "Bank message"
          expect(resp.min_amount).to eq 10.0
          expect(resp.type).to eq "commercial"
          expect(resp.parent).to eq "ACME INC"
        end
      end
    end
  end
end
