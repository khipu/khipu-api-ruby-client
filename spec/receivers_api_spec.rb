require "spec_helper"

describe Khipu::ReceiversApi do
  it_behaves_like "an API handler" do
    describe "#receivers_post(*)" do
      let(:response_object) {
        Khipu::ReceiversCreateResponse.new(
          receiver_id: 123
        )
      }

      it "uses api_client to process request and wrap response" do
        expect(api_client).to receive(:call_api) do |http_method, path, opts|
          expect(http_method).to eq :POST
          expect(path).to eq "/receivers"
          expect(opts[:header_params]["Accept"]).to eq "application/json"
          expect(opts[:header_params]["Content-Type"]).to eq "application/x-www-form-urlencoded"
          expect(opts[:form_params]["admin_first_name"]).to eq "Joe"
          expect(opts[:form_params]["admin_last_name"]).to eq "Bloggs"
          expect(opts[:form_params]["admin_email"]).to eq "admin@email.com"
          expect(opts[:form_params]["country_code"]).to eq "CL"
          expect(opts[:form_params]["business_identifier"]).to eq "acme"
          expect(opts[:form_params]["business_category"]).to eq "business"
          expect(opts[:form_params]["business_name"]).to eq "ACME"
          expect(opts[:form_params]["business_phone"]).to eq "123456789"
          expect(opts[:form_params]["business_address_line_1"]).to eq "Address line 1"
          expect(opts[:form_params]["business_address_line_2"]).to eq "Address line 2"
          expect(opts[:form_params]["business_address_line_3"]).to eq "Address line 3"
          expect(opts[:form_params]["contact_full_name"]).to eq "Contact Full Name"
          expect(opts[:form_params]["contact_job_title"]).to eq "CTO"
          expect(opts[:form_params]["contact_email"]).to eq "contact@email.com"
          expect(opts[:form_params]["contact_phone"]).to eq "987654321"
          expect(opts[:auth_names]).to eq ["khipu"]
          expect(opts[:return_type]).to eq "ReceiversCreateResponse"
        end.and_return response_object

        resp = subject.receivers_post(
          "Joe",
          "Bloggs",
          "admin@email.com",
          "CL",
          "acme",
          "business",
          "ACME",
          "123456789",
          "Address line 1",
          "Address line 2",
          "Address line 3",
          "Contact Full Name",
          "CTO",
          "contact@email.com",
          "987654321"
        )

        expect(resp).to eq response_object
      end
    end
  end
end
