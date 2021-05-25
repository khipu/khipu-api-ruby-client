module Khipu
  # 
  class PaymentsCreateResponse < BaseObject
    attr_accessor :payment_id, :payment_url, :simplified_transfer_url, :transfer_url, :webpay_url, :hites_url, :payme_url, :app_url, :ready_for_terminal
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
        
        # URL de pago usando Webpay
        :'webpay_url' => :'webpay_url',
        
        # URL de pago usando Hites
        :'hites_url' => :'hites_url',
        
        # URL de pago usando Hites
        :'payme_url' => :'payme_url',
        
        # URL para invocar el pago desde un dispositivo móvil usando la APP de khipu
        :'app_url' => :'app_url',
        
        # Es &#39;true&#39; si el pago ya cuenta con todos los datos necesarios para abrir directamente la aplicación de pagos khipu
        :'ready_for_terminal' => :'ready_for_terminal'
        
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
        :'ready_for_terminal' => :'BOOLEAN'
        
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
      
    end

  end
end
