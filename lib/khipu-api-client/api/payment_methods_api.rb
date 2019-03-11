require "uri"

module Khipu
  class PaymentMethodsApi
    attr_accessor :api_client

    def initialize(api_client = nil)
      @api_client = api_client || Configuration.api_client
    end

    # Obtener listado de medios de pago disponible para una cuenta de cobrador
    # Obtiene el listado de medios de pago que pueden usarse para pagar a esta cuenta de cobro.
    # @param id Identificador del merchant
    # @param [Hash] opts the optional parameters
    # @return [PaymentMethodsResponse]
    def merchants_id_payment_methods_get(id, opts = {})
      if Configuration.debugging
        Configuration.logger.debug "Calling API: PaymentMethodsApi#merchants_id_payment_methods_get ..."
      end
      
      # verify the required parameter 'id' is set
      fail "Missing the required parameter 'id' when calling merchants_id_payment_methods_get" if id.nil?
      
      # resource path
      path = "/merchants/{id}/paymentMethods".sub('{format}','json').sub('{' + 'id' + '}', id.to_s)

      # query parameters
      query_params = {}

      # header parameters
      header_params = {}

      # HTTP header 'Accept' (if needed)
      _header_accept = ['application/json']
      _header_accept_result = @api_client.select_header_accept(_header_accept) and header_params['Accept'] = _header_accept_result

      # HTTP header 'Content-Type'
      _header_content_type = ['application/x-www-form-urlencoded']
      header_params['Content-Type'] = @api_client.select_header_content_type(_header_content_type)

      # form parameters
      form_params = {}

      # http body (model)
      post_body = nil
      

      auth_names = ['khipu']
      result = @api_client.call_api(:GET, path,
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => 'PaymentMethodsResponse')
      if Configuration.debugging
        Configuration.logger.debug "API called: PaymentMethodsApi#merchants_id_payment_methods_get. Result: #{result.inspect}"
      end
      return result
    end
  end
end




