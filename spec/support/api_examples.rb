shared_examples_for "an API handler" do
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
end
