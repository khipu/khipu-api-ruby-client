module Khipu
  module Utils
    class << self
      # Return Accept header based on an array of accepts provided.
      # @param [Array] accepts array for Accept
      # @return [String] the Accept header (e.g. application/json)
      def select_header_accept(accepts)
        if accepts.empty?
          return
        elsif accepts.any?{ |s| s.casecmp('application/json') == 0 }
          'application/json' # look for json data by default
        else
          accepts.join(',')
        end
      end

      # Return Content-Type header based on an array of content types provided.
      # @param [Array] content_types array for Content-Type
      # @return [String] the Content-Type header  (e.g. application/json)
      def select_header_content_type(content_types)
        if content_types.empty?
          'application/json' # use application/json by default
        elsif content_types.any?{ |s| s.casecmp('application/json')==0 }
          'application/json' # use application/json if it's included
        else
          content_types[0] # otherwise, use the first one
        end
      end
    end
  end
end
