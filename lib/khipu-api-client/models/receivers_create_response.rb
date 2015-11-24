module Khipu
  # 
  class ReceiversCreateResponse < BaseObject
    attr_accessor :receiver_id, :secret
    # attribute mapping from ruby-style variable name to JSON key
    def self.attribute_map
      {
        
        # 
        :'receiver_id' => :'receiver_id',
        
        # 
        :'secret' => :'secret'
        
      }
    end

    # attribute type
    def self.swagger_types
      {
        :'receiver_id' => :'String',
        :'secret' => :'String'
        
      }
    end

    def initialize(attributes = {})
      return if !attributes.is_a?(Hash) || attributes.empty?

      # convert string to symbol for hash key
      attributes = attributes.inject({}){|memo,(k,v)| memo[k.to_sym] = v; memo}

      
      if attributes[:'receiver_id']
        self.receiver_id = attributes[:'receiver_id']
      end
      
      if attributes[:'secret']
        self.secret = attributes[:'secret']
      end
      
    end

  end
end
