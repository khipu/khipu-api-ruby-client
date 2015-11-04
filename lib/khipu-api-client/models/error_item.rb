module Khipu
  # 
  class ErrorItem < BaseObject
    attr_accessor :field, :message
    # attribute mapping from ruby-style variable name to JSON key
    def self.attribute_map
      {
        
        # 
        :'field' => :'field',
        
        # 
        :'message' => :'message'
        
      }
    end

    # attribute type
    def self.swagger_types
      {
        :'field' => :'String',
        :'message' => :'String'
        
      }
    end

    def initialize(attributes = {})
      return if !attributes.is_a?(Hash) || attributes.empty?

      # convert string to symbol for hash key
      attributes = attributes.inject({}){|memo,(k,v)| memo[k.to_sym] = v; memo}

      
      if attributes[:'field']
        self.field = attributes[:'field']
      end
      
      if attributes[:'message']
        self.message = attributes[:'message']
      end
      
    end

  end
end
