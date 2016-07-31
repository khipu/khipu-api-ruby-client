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

  context "local configuration" do
    it "uses Configuration instance" do
      conf = Khipu::Configuration.new.tap do |c|
        c.secret           = 'aaxx'
        c.host             = 'test.khipu.com'
        c.base_path        = '/api/3.0'
        c.receiver_id      = 1111
        c.platform         = 'FooCompany'
        c.platform_version = '1.2'
      end

      subject = described_class.new(conf)

      assert_api_call(
        url: "https://test.khipu.com/api/3.0/foo/bar",
        method: :post,
        ua: /FooCompany/
      )
      subject.call_api('post', '/foo/bar')
    end
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

    context "invalid response" do
      it "raises a meaningful exception" do
        allow(http_response).to receive(:success?).and_return false
        expect{
          subject.call_api('post', '/foo/bar')
        }.to raise_error Khipu::ApiError
      end
    end

    context "return types" do
      let(:resp) { subject.call_api('post', '/foo/bar', return_type: return_type) }

      describe "no return type" do
        let(:return_type) { nil }

        it "returns nil" do
          expect(resp).to be_nil
        end
      end

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

      describe "String" do
        let(:response_body) { "A string" }
        let(:return_type) { "String" }

        it "returns expected response" do
          expect(resp).to eq "A string"
        end
      end

      describe "Integer" do
        let(:response_body) { "1234" }
        let(:return_type) { "Integer" }

        it "returns expected response" do
          expect(resp).to eq 1234
        end
      end

      describe "Float" do
        let(:response_body) { "1234.12" }
        let(:return_type) { "Float" }

        it "returns expected response" do
          expect(resp).to eq 1234.12
        end
      end

      describe "BOOLEAN" do
        let(:response_body) { "true" }
        let(:return_type) { "BOOLEAN" }

        it "returns expected response" do
          expect(resp).to eq true
        end
      end

      describe "DateTime" do
        let(:response_body) { "2001-02-03 10:00:00" }
        let(:return_type) { "DateTime" }

        it "returns expected response" do
          expect(resp).to be_a DateTime
          expect(resp.year).to eq 2001
          expect(resp.month).to eq 2
          expect(resp.day).to eq 3
          expect(resp.hour).to eq 10
        end
      end

      describe "Date" do
        let(:response_body) { "2001-02-03 10:00:00" }
        let(:return_type) { "Date" }

        it "returns expected response" do
          expect(resp).to be_a Date
          expect(resp.year).to eq 2001
          expect(resp.month).to eq 2
          expect(resp.day).to eq 3
        end
      end

      describe "Object" do
        let(:return_type) { "Object" }
        let(:body_data) {
          {
            foo: {
              bar: [1,2,3]
            }
          }
        }

        it "returns expected response" do
          expect(resp).to be_a Hash
          expect(resp[:foo]).to eq(
            {
              bar: [1,2,3]
            }
          )
        end
      end

      describe "Array" do
        let(:return_type) { "Array<Object>" }
        let(:body_data) {
          [
            {name: "Foo"},
            {name: "Bar"}
          ]
        }

        it "returns expected response" do
          expect(resp).to be_a Array
          expect(resp[0][:name]).to eq "Foo"
          expect(resp[1][:name]).to eq "Bar"
        end
      end

      describe "Hash" do
        let(:return_type) { "Hash<String, Object>" }
        let(:body_data) {
          {
            one: {name: "Foo"},
            two: {name: "Bar"},
          }
        }

        it "returns expected response" do
          expect(resp).to be_a Hash
          expect(resp[:one][:name]).to eq "Foo"
          expect(resp[:two][:name]).to eq "Bar"
        end
      end
    end
  end
end
