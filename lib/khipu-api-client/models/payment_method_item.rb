module Khipu
  # 
  class PaymentMethodItem < BaseObject
    attr_accessor :id, :name, :logo_url
    # attribute mapping from ruby-style variable name to JSON key
    def self.attribute_map
      {
        
        # Identificador del medio de pago
        :'id' => :'id',
        
        # Nombre del medio de pago
        :'name' => :'name',
        
        # URL del logo sugerido para mostrar
        :'logo_url' => :'logo_url'
        
      }
    end

    # attribute type
    def self.swagger_types
      {
        :'id' => :'String',
        :'name' => :'String',
        :'logo_url' => :'String'
        
      }
    end

    def initialize(attributes = {})
      return if !attributes.is_a?(Hash) || attributes.empty?

      # convert string to symbol for hash key
      attributes = attributes.inject({}){|memo,(k,v)| memo[k.to_sym] = v; memo}

      
      if attributes[:'id']
        self.id = attributes[:'id']
      end
      
      if attributes[:'name']
        self.name = attributes[:'name']
      end
      
      if attributes[:'logo_url']
        self.logo_url = attributes[:'logo_url']
      end
      
    end

  end
end
