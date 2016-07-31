require "spec_helper"

describe Khipu::PaymentsApi do
  it_behaves_like "an API handler" do
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

    describe "#payments_post(subject, currency, amount, opts)" do
      let(:response_object) {
        Khipu::PaymentsCreateResponse.new(
          payment_id: 123
        )
      }

      it "uses api_client to process request and wrap response" do
        expect(api_client).to receive(:call_api) do |http_method, path, opts|
          expect(http_method).to eq :POST
          expect(path).to eq "/payments"
          expect(opts[:header_params]["Accept"]).to eq "application/json"
          expect(opts[:header_params]["Content-Type"]).to eq "application/x-www-form-urlencoded"
          expect(opts[:query_params]).to eq({})
          expect(opts[:form_params]["subject"]).to eq "a payment"
          expect(opts[:form_params]["currency"]).to eq "CLP"
          expect(opts[:form_params]["amount"]).to eq 1000
          expect(opts[:form_params]["send_email"]).to eq true
          expect(opts[:form_params]["payer_name"]).to eq "John Payer"
          expect(opts[:form_params]["payer_email"]).to eq "payer@email.com"
          expect(opts[:auth_names]).to eq ["khipu"]
          expect(opts[:return_type]).to eq "PaymentsCreateResponse"
        end.and_return response_object

        resp = subject.payments_post(
          "a payment",
          "CLP",
          1000,
          send_email: true,
          payer_name: "John Payer",
          payer_email: "payer@email.com"
        )

        expect(resp).to eq response_object
      end
    end

    describe "#payments_id_get(id, opts)" do
      let(:response_object) {
        Khipu::PaymentsResponse.new(
         payment_id: "123",
         payment_url: "http://host.com/a/b",
        )
      }

      it "uses api_client to process request and wrap response" do
        expect(api_client).to receive(:call_api) do |http_method, path, opts|
          expect(http_method).to eq :GET
          expect(path).to eq "/payments/123"
          expect(opts[:header_params]["Accept"]).to eq "application/json"
          expect(opts[:header_params]["Content-Type"]).to eq "application/x-www-form-urlencoded"
          expect(opts[:query_params]).to eq({})
          expect(opts[:form_params]).to eq({})
          expect(opts[:body]).to be_nil
          expect(opts[:auth_names]).to eq ["khipu"]
          expect(opts[:return_type]).to eq "PaymentsResponse"
        end.and_return response_object

        expect(subject.payments_id_get(123)).to eq response_object
      end
    end

    describe "#payments_id_delete(id, opts)" do
      let(:response_object) {
        Khipu::PaymentsResponse.new(
         payment_id: "123",
         payment_url: "http://host.com/a/b",
        )
      }

      it "uses api_client to process request and wrap response" do
        expect(api_client).to receive(:call_api) do |http_method, path, opts|
          expect(http_method).to eq :DELETE
          expect(path).to eq "/payments/123"
          expect(opts[:header_params]["Accept"]).to eq "application/json"
          expect(opts[:header_params]["Content-Type"]).to eq "application/x-www-form-urlencoded"
          expect(opts[:query_params]).to eq({})
          expect(opts[:form_params]).to eq({})
          expect(opts[:body]).to be_nil
          expect(opts[:auth_names]).to eq ["khipu"]
          expect(opts[:return_type]).to eq "SuccessResponse"
        end.and_return response_object

        expect(subject.payments_id_delete(123)).to eq response_object
      end
    end

    describe "#payments_id_refunds_post(id, opts)" do
      let(:response_object) {
        Khipu::PaymentsResponse.new(
         payment_id: "123",
         payment_url: "http://host.com/a/b",
        )
      }

      it "uses api_client to process request and wrap response" do
        expect(api_client).to receive(:call_api) do |http_method, path, opts|
          expect(http_method).to eq :POST
          expect(path).to eq "/payments/123/refunds"
          expect(opts[:header_params]["Accept"]).to eq "application/json"
          expect(opts[:header_params]["Content-Type"]).to eq "application/x-www-form-urlencoded"
          expect(opts[:query_params]).to eq({})
          expect(opts[:form_params]["amount"]).to eq 2000
          expect(opts[:body]).to be_nil
          expect(opts[:auth_names]).to eq ["khipu"]
          expect(opts[:return_type]).to eq "SuccessResponse"
        end.and_return response_object

        resp = subject.payments_id_refunds_post(123, {
          amount: 2000
        })

        expect(resp).to eq response_object
      end
    end
  end
end

