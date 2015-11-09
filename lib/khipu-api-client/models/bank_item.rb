module Khipu
  # 
  class BankItem < BaseObject
    attr_accessor :bank_id, :name, :message, :min_amount, :type, :parent
    # attribute mapping from ruby-style variable name to JSON key
    def self.attribute_map
      {
        
        # 
        :'bank_id' => :'bank_id',
        
        # 
        :'name' => :'name',
        
        # 
        :'message' => :'message',
        
        # 
        :'min_amount' => :'min_amount',
        
        # 
        :'type' => :'type',
        
        # 
        :'parent' => :'parent'
        
      }
    end

    # attribute type
    def self.swagger_types
      {
        :'bank_id' => :'String',
        :'name' => :'String',
        :'message' => :'String',
        :'min_amount' => :'Float',
        :'type' => :'String',
        :'parent' => :'String'
        
      }
    end

    def initialize(attributes = {})
      return if !attributes.is_a?(Hash) || attributes.empty?

      # convert string to symbol for hash key
      attributes = attributes.inject({}){|memo,(k,v)| memo[k.to_sym] = v; memo}

      
      if attributes[:'bank_id']
        self.bank_id = attributes[:'bank_id']
      end
      
      if attributes[:'name']
        self.name = attributes[:'name']
      end
      
      if attributes[:'message']
        self.message = attributes[:'message']
      end
      
      if attributes[:'min_amount']
        self.min_amount = attributes[:'min_amount']
      end
      
      if attributes[:'type']
        self.type = attributes[:'type']
      end
      
      if attributes[:'parent']
        self.parent = attributes[:'parent']
      end
      
    end

  end
end
