require "uri"

module Khipu
  class ReceiversApi
    attr_accessor :api_client

    def initialize(api_client = nil)
      @api_client = api_client || Configuration.api_client
    end

    # Crear una nueva cuenta de cobro
    # Crear una nueva cuenta de cobro asociada a un integrador. Necesita datos de la cuenta de usuario asociada, datos de facturación y datos de contacto.
    # @param admin_first_name Nombre de pila del administrador de la cuenta de cobro a crear.
    # @param admin_last_name Apellido del administrador de la cuenta de cobro a crear.
    # @param admin_email Correo electrónico del administrador de la cuenta de cobro a crear.
    # @param country_code Código alfanumérico de dos caractéres ISO 3166-1 del país de la cuenta de cobro a crear.
    # @param business_identifier Identificador tributario del cobrador asociado a la cuenta de cobro a crear.
    # @param business_category Categoría tributaria o rubro tributario del cobrador asociado a la cuenta de cobro a crear.
    # @param business_name Nombre tributario del cobrador asociado a la cuenta de cobro a crear.
    # @param business_phone Teléfono del cobrador asociado a la cuenta de cobro a crear.
    # @param business_address_line_1 Dirección del cobrador de la cuenta de cobro a crear.
    # @param business_address_line_2 Segunda línea de la dirección del cobrador de la cuenta de cobro a crear.
    # @param business_address_line_3 Tercera línea de la dirección del cobrador de la cuenta de cobro a crear.
    # @param contact_full_name Nombre del contacto del cobrador.
    # @param contact_job_title Cargo del contacto del cobrador.
    # @param contact_email Correo electrónico del contacto del cobrador.
    # @param contact_phone Teléfono del contacto del cobrador.
    # @param [Hash] opts the optional parameters
    # @return [ReceiversCreateResponse]
    def receivers_post(admin_first_name, admin_last_name, admin_email, country_code, business_identifier, business_category, business_name, business_phone, business_address_line_1, business_address_line_2, business_address_line_3, contact_full_name, contact_job_title, contact_email, contact_phone, opts = {})
      if Configuration.debugging
        Configuration.logger.debug "Calling API: ReceiversApi#receivers_post ..."
      end
      
      # verify the required parameter 'admin_first_name' is set
      fail "Missing the required parameter 'admin_first_name' when calling receivers_post" if admin_first_name.nil?
      
      # verify the required parameter 'admin_last_name' is set
      fail "Missing the required parameter 'admin_last_name' when calling receivers_post" if admin_last_name.nil?
      
      # verify the required parameter 'admin_email' is set
      fail "Missing the required parameter 'admin_email' when calling receivers_post" if admin_email.nil?
      
      # verify the required parameter 'country_code' is set
      fail "Missing the required parameter 'country_code' when calling receivers_post" if country_code.nil?
      
      # verify the required parameter 'business_identifier' is set
      fail "Missing the required parameter 'business_identifier' when calling receivers_post" if business_identifier.nil?
      
      # verify the required parameter 'business_category' is set
      fail "Missing the required parameter 'business_category' when calling receivers_post" if business_category.nil?
      
      # verify the required parameter 'business_name' is set
      fail "Missing the required parameter 'business_name' when calling receivers_post" if business_name.nil?
      
      # verify the required parameter 'business_phone' is set
      fail "Missing the required parameter 'business_phone' when calling receivers_post" if business_phone.nil?
      
      # verify the required parameter 'business_address_line_1' is set
      fail "Missing the required parameter 'business_address_line_1' when calling receivers_post" if business_address_line_1.nil?
      
      # verify the required parameter 'business_address_line_2' is set
      fail "Missing the required parameter 'business_address_line_2' when calling receivers_post" if business_address_line_2.nil?
      
      # verify the required parameter 'business_address_line_3' is set
      fail "Missing the required parameter 'business_address_line_3' when calling receivers_post" if business_address_line_3.nil?
      
      # verify the required parameter 'contact_full_name' is set
      fail "Missing the required parameter 'contact_full_name' when calling receivers_post" if contact_full_name.nil?
      
      # verify the required parameter 'contact_job_title' is set
      fail "Missing the required parameter 'contact_job_title' when calling receivers_post" if contact_job_title.nil?
      
      # verify the required parameter 'contact_email' is set
      fail "Missing the required parameter 'contact_email' when calling receivers_post" if contact_email.nil?
      
      # verify the required parameter 'contact_phone' is set
      fail "Missing the required parameter 'contact_phone' when calling receivers_post" if contact_phone.nil?
      
      # resource path
      path = "/receivers".sub('{format}','json')

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
      form_params["admin_first_name"] = admin_first_name
      form_params["admin_last_name"] = admin_last_name
      form_params["admin_email"] = admin_email
      form_params["country_code"] = country_code
      form_params["business_identifier"] = business_identifier
      form_params["business_category"] = business_category
      form_params["business_name"] = business_name
      form_params["business_phone"] = business_phone
      form_params["business_address_line_1"] = business_address_line_1
      form_params["business_address_line_2"] = business_address_line_2
      form_params["business_address_line_3"] = business_address_line_3
      form_params["contact_full_name"] = contact_full_name
      form_params["contact_job_title"] = contact_job_title
      form_params["contact_email"] = contact_email
      form_params["contact_phone"] = contact_phone

      # http body (model)
      post_body = nil
      

      auth_names = ['khipu']
      result = @api_client.call_api(:POST, path,
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => 'ReceiversCreateResponse')
      if Configuration.debugging
        Configuration.logger.debug "API called: ReceiversApi#receivers_post. Result: #{result.inspect}"
      end
      return result
    end
  end
end




