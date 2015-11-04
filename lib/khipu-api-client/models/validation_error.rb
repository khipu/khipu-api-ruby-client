module Khipu
  # 
  class ValidationError < BaseObject
    attr_accessor :status, :message, :errors
    # attribute mapping from ruby-style variable name to JSON key
    def self.attribute_map
      {
        
        # 
        :'status' => :'status',
        
        # 
        :'message' => :'message',
        
        # 
        :'errors' => :'errors'
        
      }
    end

    # attribute type
    def self.swagger_types
      {
        :'status' => :'Integer',
        :'message' => :'String',
        :'errors' => :'Array<ErrorItem>'
        
      }
    end

    def initialize(attributes = {})
      return if !attributes.is_a?(Hash) || attributes.empty?

      # convert string to symbol for hash key
      attributes = attributes.inject({}){|memo,(k,v)| memo[k.to_sym] = v; memo}

      
      if attributes[:'status']
        self.status = attributes[:'status']
      end
      
      if attributes[:'message']
        self.message = attributes[:'message']
      end
      
      if attributes[:'errors']
        if (value = attributes[:'errors']).is_a?(Array)
          self.errors = value
        end
      end
      
    end

  end
end
