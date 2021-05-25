module Khipu
  # 
  class PaymentsResponse < BaseObject
    attr_accessor :payment_id, :payment_url, :simplified_transfer_url, :transfer_url, :webpay_url, :hites_url, :payme_url, :app_url, :ready_for_terminal, :notification_token, :receiver_id, :conciliation_date, :subject, :amount, :currency, :status, :status_detail, :body, :picture_url, :receipt_url, :return_url, :cancel_url, :notify_url, :notify_api_version, :expires_date, :attachment_urls, :bank, :bank_id, :payer_name, :payer_email, :personal_identifier, :bank_account_number, :out_of_date_conciliation, :transaction_id, :custom, :responsible_user_email, :send_reminders, :send_email, :payment_method, :funds_source
    # attribute mapping from ruby-style variable name to JSON key
    def self.attribute_map
      {
        
        # Identificador único del pago, es una cadena alfanumérica de 12 caracteres. Cómo este identificador es único, se puede usar, por ejemplo, para evitar procesar una notificación repetida. (Khipu espera un código 200 al notificar un pago, si esto no ocurre se reintenta hasta por dos días).
        :'payment_id' => :'payment_id',
        
        # URL principal del pago, si el usuario no ha elegido previamente un método de pago se le muestran las opciones
        :'payment_url' => :'payment_url',
        
        # URL de pago simplificado
        :'simplified_transfer_url' => :'simplified_transfer_url',
        
        # URL de pago normal
        :'transfer_url' => :'transfer_url',
        
        # URL de pago con Webpay
        :'webpay_url' => :'webpay_url',
        
        # URL de pago con Hites
        :'hites_url' => :'hites_url',
        
        # URL de pago con Hites
        :'payme_url' => :'payme_url',
        
        # URL para invocar el pago desde un dispositivo móvil usando la APP de khipu
        :'app_url' => :'app_url',
        
        # Es &#39;true&#39; si el pago ya cuenta con todos los datos necesarios para abrir directamente la aplicación de pagos khipu
        :'ready_for_terminal' => :'ready_for_terminal',
        
        # Cadena de caracteres alfanuméricos que identifican unicamente al pago, es el identificador que el servidor de khipu enviará al servidor del comercio cuando notifique que un pago está conciliado
        :'notification_token' => :'notification_token',
        
        # Identificador único de una cuenta de cobro
        :'receiver_id' => :'receiver_id',
        
        # Fecha y hora de conciliación del pago. Formato ISO-8601. Ej: 2017-03-01T13:00:00Z
        :'conciliation_date' => :'conciliation_date',
        
        # Motivo del pago
        :'subject' => :'subject',
        
        # Monto del pago, sin separador de miles y usando &#39;.&#39; como separador de decimales.
        :'amount' => :'amount',
        
        # El código de moneda en formato ISO-4217
        :'currency' => :'currency',
        
        # Estado del pago, puede ser &#39;pending&#39; (el pagador aún no comienza a pagar), &#39;verifying&#39; (se está verificando el pago) o &#39;done&#39;, cuando el pago ya está confirmado
        :'status' => :'status',
        
        # Detalle del estado del pago, &#39;pending&#39; (el pagadon aún no comienza a pagar), &#39;normal&#39; (el pago fue verificado y fue cancelado por algún medio de pago estandar), &#39;marked-paid-by-receiver&#39; (el cobrador marco el cobro como pagado por otro medio), &#39;rejected-by-payer&#39; (el pagador declaró que no pagará), &#39;marked-as-abuse&#39; (el pagador declaró que no pagará y que el cobro fue no solicitado) y &#39;reversed&#39; (el pago fue anulado por el comercio, el dinero fue devuelto al pagador).
        :'status_detail' => :'status_detail',
        
        # Detalle del cobro
        :'body' => :'body',
        
        # URL de cobro
        :'picture_url' => :'picture_url',
        
        # URL del comprobante de pago
        :'receipt_url' => :'receipt_url',
        
        # URL donde se redirige al pagador luego que termina el pago
        :'return_url' => :'return_url',
        
        # URL donde se redirige al pagador luego de que desiste hacer el pago
        :'cancel_url' => :'cancel_url',
        
        # URL del webservice donde se notificará el pago
        :'notify_url' => :'notify_url',
        
        # Versión de la api de notificación
        :'notify_api_version' => :'notify_api_version',
        
        # Fecha de expiración del pago. En formato ISO-8601
        :'expires_date' => :'expires_date',
        
        # URLs de archivos adjuntos al pago
        :'attachment_urls' => :'attachment_urls',
        
        # Nombre del banco seleccionado por el pagador
        :'bank' => :'bank',
        
        # Identificador del banco seleccionado por el pagador
        :'bank_id' => :'bank_id',
        
        # Nombre del pagador
        :'payer_name' => :'payer_name',
        
        # Correo electrónico del pagador
        :'payer_email' => :'payer_email',
        
        # Identificador personal del pagador
        :'personal_identifier' => :'personal_identifier',
        
        # Número de cuenta bancaria del pagador
        :'bank_account_number' => :'bank_account_number',
        
        # Es &#39;true&#39; si la conciliación del pago fue hecha luego de la fecha de expiración
        :'out_of_date_conciliation' => :'out_of_date_conciliation',
        
        # Identificador del pago asignado por el cobrador
        :'transaction_id' => :'transaction_id',
        
        # Campo genérico que asigna el cobrador al momento de hacer el pago
        :'custom' => :'custom',
        
        # Correo electrónico de la persona responsable del pago
        :'responsible_user_email' => :'responsible_user_email',
        
        # Es &#39;true&#39; cuando este es un cobro por correo electrónico y khipu enviará recordatorios
        :'send_reminders' => :'send_reminders',
        
        # Es &#39;true&#39; cuando khipu enviará el cobro por correo electrónico
        :'send_email' => :'send_email',
        
        # Método de pago usado por el pagador, puede ser &#39;regular_transfer&#39; (transferencia normal), &#39;simplified_transfer&#39; (transferencia simplificada) o &#39;not_available&#39; (para un pago marcado como realizado por otro medio por el cobrador).
        :'payment_method' => :'payment_method',
        
        # Origen de fondos usado por el pagador, puede ser &#39;debit&#39; para pago con débito, &#39;prepaid&#39; para pago con prepago, &#39;credit&#39; para pago con crédito o vacío en el caso de que se haya pagado mediante transferencia bancaria.
        :'funds_source' => :'funds_source'
        
      }
    end

    # attribute type
    def self.swagger_types
      {
        :'payment_id' => :'String',
        :'payment_url' => :'String',
        :'simplified_transfer_url' => :'String',
        :'transfer_url' => :'String',
        :'webpay_url' => :'String',
        :'hites_url' => :'String',
        :'payme_url' => :'String',
        :'app_url' => :'String',
        :'ready_for_terminal' => :'BOOLEAN',
        :'notification_token' => :'String',
        :'receiver_id' => :'Integer',
        :'conciliation_date' => :'DateTime',
        :'subject' => :'String',
        :'amount' => :'Float',
        :'currency' => :'String',
        :'status' => :'String',
        :'status_detail' => :'String',
        :'body' => :'String',
        :'picture_url' => :'String',
        :'receipt_url' => :'String',
        :'return_url' => :'String',
        :'cancel_url' => :'String',
        :'notify_url' => :'String',
        :'notify_api_version' => :'String',
        :'expires_date' => :'DateTime',
        :'attachment_urls' => :'Array<String>',
        :'bank' => :'String',
        :'bank_id' => :'String',
        :'payer_name' => :'String',
        :'payer_email' => :'String',
        :'personal_identifier' => :'String',
        :'bank_account_number' => :'String',
        :'out_of_date_conciliation' => :'BOOLEAN',
        :'transaction_id' => :'String',
        :'custom' => :'String',
        :'responsible_user_email' => :'String',
        :'send_reminders' => :'BOOLEAN',
        :'send_email' => :'BOOLEAN',
        :'payment_method' => :'String',
        :'funds_source' => :'String'
        
      }
    end

    def initialize(attributes = {})
      return if !attributes.is_a?(Hash) || attributes.empty?

      # convert string to symbol for hash key
      attributes = attributes.inject({}){|memo,(k,v)| memo[k.to_sym] = v; memo}

      
      if attributes[:'payment_id']
        self.payment_id = attributes[:'payment_id']
      end
      
      if attributes[:'payment_url']
        self.payment_url = attributes[:'payment_url']
      end
      
      if attributes[:'simplified_transfer_url']
        self.simplified_transfer_url = attributes[:'simplified_transfer_url']
      end
      
      if attributes[:'transfer_url']
        self.transfer_url = attributes[:'transfer_url']
      end
      
      if attributes[:'webpay_url']
        self.webpay_url = attributes[:'webpay_url']
      end
      
      if attributes[:'hites_url']
        self.hites_url = attributes[:'hites_url']
      end
      
      if attributes[:'payme_url']
        self.payme_url = attributes[:'payme_url']
      end
      
      if attributes[:'app_url']
        self.app_url = attributes[:'app_url']
      end
      
      if attributes[:'ready_for_terminal']
        self.ready_for_terminal = attributes[:'ready_for_terminal']
      end
      
      if attributes[:'notification_token']
        self.notification_token = attributes[:'notification_token']
      end
      
      if attributes[:'receiver_id']
        self.receiver_id = attributes[:'receiver_id']
      end
      
      if attributes[:'conciliation_date']
        self.conciliation_date = attributes[:'conciliation_date']
      end
      
      if attributes[:'subject']
        self.subject = attributes[:'subject']
      end
      
      if attributes[:'amount']
        self.amount = attributes[:'amount']
      end
      
      if attributes[:'currency']
        self.currency = attributes[:'currency']
      end
      
      if attributes[:'status']
        self.status = attributes[:'status']
      end
      
      if attributes[:'status_detail']
        self.status_detail = attributes[:'status_detail']
      end
      
      if attributes[:'body']
        self.body = attributes[:'body']
      end
      
      if attributes[:'picture_url']
        self.picture_url = attributes[:'picture_url']
      end
      
      if attributes[:'receipt_url']
        self.receipt_url = attributes[:'receipt_url']
      end
      
      if attributes[:'return_url']
        self.return_url = attributes[:'return_url']
      end
      
      if attributes[:'cancel_url']
        self.cancel_url = attributes[:'cancel_url']
      end
      
      if attributes[:'notify_url']
        self.notify_url = attributes[:'notify_url']
      end
      
      if attributes[:'notify_api_version']
        self.notify_api_version = attributes[:'notify_api_version']
      end
      
      if attributes[:'expires_date']
        self.expires_date = attributes[:'expires_date']
      end
      
      if attributes[:'attachment_urls']
        if (value = attributes[:'attachment_urls']).is_a?(Array)
          self.attachment_urls = value
        end
      end
      
      if attributes[:'bank']
        self.bank = attributes[:'bank']
      end
      
      if attributes[:'bank_id']
        self.bank_id = attributes[:'bank_id']
      end
      
      if attributes[:'payer_name']
        self.payer_name = attributes[:'payer_name']
      end
      
      if attributes[:'payer_email']
        self.payer_email = attributes[:'payer_email']
      end
      
      if attributes[:'personal_identifier']
        self.personal_identifier = attributes[:'personal_identifier']
      end
      
      if attributes[:'bank_account_number']
        self.bank_account_number = attributes[:'bank_account_number']
      end
      
      if attributes[:'out_of_date_conciliation']
        self.out_of_date_conciliation = attributes[:'out_of_date_conciliation']
      end
      
      if attributes[:'transaction_id']
        self.transaction_id = attributes[:'transaction_id']
      end
      
      if attributes[:'custom']
        self.custom = attributes[:'custom']
      end
      
      if attributes[:'responsible_user_email']
        self.responsible_user_email = attributes[:'responsible_user_email']
      end
      
      if attributes[:'send_reminders']
        self.send_reminders = attributes[:'send_reminders']
      end
      
      if attributes[:'send_email']
        self.send_email = attributes[:'send_email']
      end
      
      if attributes[:'payment_method']
        self.payment_method = attributes[:'payment_method']
      end
      
      if attributes[:'funds_source']
        self.funds_source = attributes[:'funds_source']
      end
      
    end

  end
end
