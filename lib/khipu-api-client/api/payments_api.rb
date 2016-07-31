require "uri"

module Khipu
  class PaymentsApi
    attr_accessor :api_client

    def initialize(configuration = Configuration.instance)
      @configuration = configuration
      @api_client = configuration.api_client
    end

    # Obtener información de un pago
    # Información completa del pago. Datos con los que fue creado y el estado actual del pago. Se obtiene del notification_token que envia khipu cuando el pago es conciliado.
    # @param notification_token Token de notifiación recibido usando la API de notificaiones 1.3 o superior.
    # @param [Hash] opts the optional parameters
    # @return [PaymentsResponse]
    def payments_get(notification_token, opts = {})
      if configuration.debugging
        configuration.logger.debug "Calling API: PaymentsApi#payments_get ..."
      end

      # verify the required parameter 'notification_token' is set
      fail "Missing the required parameter 'notification_token' when calling payments_get" if notification_token.nil?

      # resource path
      path = "/payments".sub('{format}','json')

      # query parameters
      query_params = {}
      query_params[:'notification_token'] = notification_token

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
        :return_type => 'PaymentsResponse')
      if configuration.debugging
        configuration.logger.debug "API called: PaymentsApi#payments_get. Result: #{result.inspect}"
      end
      return result
    end

    # Crear un pago
    # Crea un pago en khipu y obtiene las URLs para redirección al usuario para que complete el pago.
    # @param subject Motivo
    # @param currency El código de moneda en formato ISO-4217
    # @param amount El monto del cobro. Sin separador de miles y usando &#39;.&#39; como separador de decimales. Hasta 4 lugares decimales, dependiendo de la moneda
    # @param [Hash] opts the optional parameters
    # @option opts [String] :transaction_id Identificador propio de la  transacción. Ej: número de factura u orden de compra
    # @option opts [String] :custom Parámetro para enviar información personalizada de la transacción. Ej: documento XML con el detalle del carro de compra
    # @option opts [String] :body Descripción del cobro
    # @option opts [String] :bank_id Identificador del banco para usar en el pago
    # @option opts [String] :return_url La dirección URL a donde enviar al cliente mientras el pago está siendo verificado
    # @option opts [String] :cancel_url La dirección URL a donde enviar al cliente si decide no hacer hacer la transacción
    # @option opts [String] :picture_url Una dirección URL de una foto de tu producto o servicio
    # @option opts [String] :notify_url La dirección del web-service que utilizará khipu para notificar cuando el pago esté conciliado
    # @option opts [String] :contract_url La dirección URL del archivo PDF con el contrato a firmar mediante este pago. El cobrador debe estar habilitado para este servicio y el campo &#39;fixed_payer_personal_identifier&#39; es obgligatorio
    # @option opts [String] :notify_api_version Versión de la API de notifiaciones para recibir avisos por web-service
    # @option opts [DateTime] :expires_date Fecha de expiración del cobro. Pasada esta fecha el cobro es inválido. Formato ISO-8601. Ej: 2017-03-01T13:00:00Z
    # @option opts [BOOLEAN] :send_email Si es &#39;true&#39;, se enviará una solicitud de cobro al correo especificado en &#39;payer_email&#39;
    # @option opts [String] :payer_name Nombre del pagador. Es obligatorio cuando send_email es &#39;true&#39;
    # @option opts [String] :payer_email Correo del pagador. Es obligatorio cuando send_email es &#39;true&#39;
    # @option opts [BOOLEAN] :send_reminders Si es &#39;true&#39;, se enviarán recordatorios de cobro.
    # @option opts [String] :responsible_user_email Correo electrónico del responsable de este cobro, debe corresponder a un usuario khipu con permisos para cobrar usando esta cuenta de cobro
    # @option opts [String] :fixed_payer_personal_identifier Identificador personal. Si se especifica, solo podrá ser pagado usando ese identificador
    # @option opts [Float] :integrator_fee Comisión para el integrador. Sólo es válido si la cuenta de cobro tiene una cuenta de integrador asociada
    # @return [PaymentsCreateResponse]
    def payments_post(subject, currency, amount, opts = {})
      if configuration.debugging
        configuration.logger.debug "Calling API: PaymentsApi#payments_post ..."
      end

      # verify the required parameter 'subject' is set
      fail "Missing the required parameter 'subject' when calling payments_post" if subject.nil?

      # verify the required parameter 'currency' is set
      fail "Missing the required parameter 'currency' when calling payments_post" if currency.nil?

      # verify the required parameter 'amount' is set
      fail "Missing the required parameter 'amount' when calling payments_post" if amount.nil?

      # resource path
      path = "/payments".sub('{format}','json')

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
      form_params["subject"] = subject
      form_params["currency"] = currency
      form_params["amount"] = amount
      form_params["transaction_id"] = opts[:'transaction_id'] if opts[:'transaction_id']
      form_params["custom"] = opts[:'custom'] if opts[:'custom']
      form_params["body"] = opts[:'body'] if opts[:'body']
      form_params["bank_id"] = opts[:'bank_id'] if opts[:'bank_id']
      form_params["return_url"] = opts[:'return_url'] if opts[:'return_url']
      form_params["cancel_url"] = opts[:'cancel_url'] if opts[:'cancel_url']
      form_params["picture_url"] = opts[:'picture_url'] if opts[:'picture_url']
      form_params["notify_url"] = opts[:'notify_url'] if opts[:'notify_url']
      form_params["contract_url"] = opts[:'contract_url'] if opts[:'contract_url']
      form_params["notify_api_version"] = opts[:'notify_api_version'] if opts[:'notify_api_version']
      form_params["expires_date"] = opts[:'expires_date'] if opts[:'expires_date']
      form_params["send_email"] = opts[:'send_email'] if opts[:'send_email']
      form_params["payer_name"] = opts[:'payer_name'] if opts[:'payer_name']
      form_params["payer_email"] = opts[:'payer_email'] if opts[:'payer_email']
      form_params["send_reminders"] = opts[:'send_reminders'] if opts[:'send_reminders']
      form_params["responsible_user_email"] = opts[:'responsible_user_email'] if opts[:'responsible_user_email']
      form_params["fixed_payer_personal_identifier"] = opts[:'fixed_payer_personal_identifier'] if opts[:'fixed_payer_personal_identifier']
      form_params["integrator_fee"] = opts[:'integrator_fee'] if opts[:'integrator_fee']

      # http body (model)
      post_body = nil


      auth_names = ['khipu']
      result = api_client.call_api(:POST, path,
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => 'PaymentsCreateResponse')
      if configuration.debugging
        configuration.logger.debug "API called: PaymentsApi#payments_post. Result: #{result.inspect}"
      end
      return result
    end

    # Obtener información de un pago
    # Información completa del pago. Datos con los que fue creado y el estado actual del pago.
    # @param id Identificador del pago
    # @param [Hash] opts the optional parameters
    # @return [PaymentsResponse]
    def payments_id_get(id, opts = {})
      if configuration.debugging
        configuration.logger.debug "Calling API: PaymentsApi#payments_id_get ..."
      end

      # verify the required parameter 'id' is set
      fail "Missing the required parameter 'id' when calling payments_id_get" if id.nil?

      # resource path
      path = "/payments/{id}".sub('{format}','json').sub('{' + 'id' + '}', id.to_s)

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
        :return_type => 'PaymentsResponse')
      if configuration.debugging
        configuration.logger.debug "API called: PaymentsApi#payments_id_get. Result: #{result.inspect}"
      end
      return result
    end

    # Borrar un pago
    # Solo se pueden borrar pagos que estén pendientes de pagar. Esta operación no puede deshacerse.
    # @param id Identificador del pago
    # @param [Hash] opts the optional parameters
    # @return [SuccessResponse]
    def payments_id_delete(id, opts = {})
      if configuration.debugging
        configuration.logger.debug "Calling API: PaymentsApi#payments_id_delete ..."
      end

      # verify the required parameter 'id' is set
      fail "Missing the required parameter 'id' when calling payments_id_delete" if id.nil?

      # resource path
      path = "/payments/{id}".sub('{format}','json').sub('{' + 'id' + '}', id.to_s)

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
      result = api_client.call_api(:DELETE, path,
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => 'SuccessResponse')
      if configuration.debugging
        configuration.logger.debug "API called: PaymentsApi#payments_id_delete. Result: #{result.inspect}"
      end
      return result
    end

    # Reembolsar total o parcialmente un pago
    # Reembolsa total o parcialmente el monto de un pago. Esta operación solo se puede realizar en los comercios que recauden en cuenta khipu y antes de la rendición de los fondos correspondientes.
    # @param id Identificador del pago
    # @param [Hash] opts the optional parameters
    # @option opts [Float] :amount El monto a devolver. Sin separador de miles y usando &#39;.&#39; como separador de decimales. Hasta 4 lugares decimales, dependiendo de la moneda. Si se omite el reembolso se hará por el total del monto del pago.
    # @return [SuccessResponse]
    def payments_id_refunds_post(id, opts = {})
      if configuration.debugging
        configuration.logger.debug "Calling API: PaymentsApi#payments_id_refunds_post ..."
      end

      # verify the required parameter 'id' is set
      fail "Missing the required parameter 'id' when calling payments_id_refunds_post" if id.nil?

      # resource path
      path = "/payments/{id}/refunds".sub('{format}','json').sub('{' + 'id' + '}', id.to_s)

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
      form_params["amount"] = opts[:'amount'] if opts[:'amount']

      # http body (model)
      post_body = nil


      auth_names = ['khipu']
      result = api_client.call_api(:POST, path,
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => 'SuccessResponse')
      if configuration.debugging
        configuration.logger.debug "API called: PaymentsApi#payments_id_refunds_post. Result: #{result.inspect}"
      end
      return result
    end

    private

    attr_reader :configuration, :api_client
  end
end

