# Common files
require 'khipu-api-client/api_client'
require 'khipu-api-client/api_error'
require 'khipu-api-client/version'
require 'khipu-api-client/configuration'

# Models
require 'khipu-api-client/models/base_object'
require 'khipu-api-client/models/payments_response'
require 'khipu-api-client/models/payments_create_response'
require 'khipu-api-client/models/receivers_create_response'
require 'khipu-api-client/models/banks_response'
require 'khipu-api-client/models/bank_item'
require 'khipu-api-client/models/success_response'
require 'khipu-api-client/models/authorization_error'
require 'khipu-api-client/models/service_error'
require 'khipu-api-client/models/validation_error'
require 'khipu-api-client/models/error_item'

# APIs
require 'khipu-api-client/api/banks_api'
require 'khipu-api-client/api/payments_api'
require 'khipu-api-client/api/receivers_api'

module Khipu
  class << self
    # Configure sdk using block.
    # Khipu.configure do |config|
    #   config.username = "xxx"
    #   config.password = "xxx"
    # end
    # If no block given, return the configuration singleton instance.
    def configure
      if block_given?
        yield Configuration.instance
      else
        Configuration.instance
      end
    end
  end
end
