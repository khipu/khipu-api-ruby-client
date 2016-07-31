require "spec_helper"

describe Khipu::PaymentsApi do
  let(:configuration) {
    Khipu::Configuration.new.tap do |c|
      c.receiver_id      = 1111
      c.secret           = 'aaxx'
      c.platform         = 'ACME'
      c.platform_version = '1.0'
    end
  }
  let(:api_client) { instance_double(Khipu::ApiClient) }

  subject { described_class.new(configuration) }

  before do
    allow(configuration).to receive(:api_client).and_return api_client
  end

  describe "#payments_get(notification_token)" do
    let(:response_object) {
      Khipu::PaymentsResponse.new(
       payment_id: "123",
       payment_url: "http://host.com/a/b",
      )
    }

    it "uses api_client to process request and wrap response" do
      expect(api_client).to receive(:call_api) do |http_method, path, opts|
        expect(http_method).to eq :GET
        expect(path).to eq "/payments"
        expect(opts[:header_params]["Accept"]).to eq "application/json"
        expect(opts[:header_params]["Content-Type"]).to eq "application/x-www-form-urlencoded"
        expect(opts[:query_params][:notification_token]).to eq "ABC"
        expect(opts[:form_params]).to eq({})
        expect(opts[:auth_names]).to eq ["khipu"]
        expect(opts[:return_type]).to eq "PaymentsResponse"
      end.and_return response_object

      expect(subject.payments_get("ABC")).to eq response_object
    end
  end
end

