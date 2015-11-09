module Khipu
  # 
  class BanksResponse < BaseObject
    attr_accessor :banks
    # attribute mapping from ruby-style variable name to JSON key
    def self.attribute_map
      {
        
        # 
        :'banks' => :'banks'
        
      }
    end

    # attribute type
    def self.swagger_types
      {
        :'banks' => :'Array<BankItem>'
        
      }
    end

    def initialize(attributes = {})
      return if !attributes.is_a?(Hash) || attributes.empty?

      # convert string to symbol for hash key
      attributes = attributes.inject({}){|memo,(k,v)| memo[k.to_sym] = v; memo}

      
      if attributes[:'banks']
        if (value = attributes[:'banks']).is_a?(Array)
          self.banks = value
        end
      end
      
    end

  end
end
