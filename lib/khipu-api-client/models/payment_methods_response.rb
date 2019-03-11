module Khipu
  # 
  class PaymentMethodsResponse < BaseObject
    attr_accessor :payment_methods
    # attribute mapping from ruby-style variable name to JSON key
    def self.attribute_map
      {
        
        # 
        :'payment_methods' => :'paymentMethods'
        
      }
    end

    # attribute type
    def self.swagger_types
      {
        :'payment_methods' => :'Array<PaymentMethodItem>'
        
      }
    end

    def initialize(attributes = {})
      return if !attributes.is_a?(Hash) || attributes.empty?

      # convert string to symbol for hash key
      attributes = attributes.inject({}){|memo,(k,v)| memo[k.to_sym] = v; memo}

      
      if attributes[:'paymentMethods']
        if (value = attributes[:'paymentMethods']).is_a?(Array)
          self.payment_methods = value
        end
      end
      
    end

  end
end
