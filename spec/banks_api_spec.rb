require "spec_helper"

describe Khipu::BanksApi do
  it_behaves_like "an API handler" do
    describe "#banks_get(opts)" do
      let(:response_object) {
        Khipu::BanksResponse.new(
          banks: [Khipu::BankItem.new(bank_id: 111)]
        )
      }

      it "uses api_client to process request and wrap response" do
        expect(api_client).to receive(:call_api) do |http_method, path, opts|
          expect(http_method).to eq :GET
          expect(path).to eq "/banks"
          expect(opts[:header_params]["Accept"]).to eq "application/json"
          expect(opts[:header_params]["Content-Type"]).to eq "application/x-www-form-urlencoded"
          expect(opts[:form_params]).to eq({})
          expect(opts[:auth_names]).to eq ["khipu"]
          expect(opts[:return_type]).to eq "BanksResponse"
        end.and_return response_object

        expect(subject.banks_get).to eq response_object
      end
    end
  end
end
