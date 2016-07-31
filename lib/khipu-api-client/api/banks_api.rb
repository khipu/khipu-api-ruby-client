require "uri"

module Khipu
  class BanksApi
    attr_accessor :api_client

    def initialize(configuration = Configuration.instance)
      @configuration = configuration
      @api_client = configuration.api_client
    end

    # Obtener listado de bancos
    # Obtiene el listado de bancos que pueden usarse para pagar a esta cuenta de cobro.
    # @param [Hash] opts the optional parameters
    # @return [BanksResponse]
    def banks_get(opts = {})
      if configuration.debugging
        configuration.logger.debug "Calling API: BanksApi#banks_get ..."
      end

      # resource path
      path = "/banks".sub('{format}','json')

      # query parameters
      query_params = {}

      # header parameters
      header_params = {}

      # HTTP header 'Accept' (if needed)
      _header_accept = ['application/json']
      _header_accept_result = Utils.select_header_accept(_header_accept) and header_params['Accept'] = _header_accept_result

      # HTTP header 'Content-Type'
      _header_content_type = ['application/x-www-form-urlencoded']
      header_params['Content-Type'] = Utils.select_header_content_type(_header_content_type)

      # form parameters
      form_params = {}

      # http body (model)
      post_body = nil


      auth_names = ['khipu']
      result = api_client.call_api(:GET, path,
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => 'BanksResponse')
      if configuration.debugging
        configuration.logger.debug "API called: BanksApi#banks_get. Result: #{result.inspect}"
      end
      return result
    end

    private
    attr_reader :api_client, :configuration
  end
end

