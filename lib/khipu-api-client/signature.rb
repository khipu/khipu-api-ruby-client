require "uri"
require 'openssl'

module Khipu
  class Signature
    ALGO = "sha256".freeze

    attr_reader :to_sign, :encoded

    def initialize(
      http_method,
      url,
      params
    )
      @http_method = http_method
      @url = url
      @params = params
      @to_sign = ""
      @encoded = {}

      prepare!
    end

    def sign!(secret)
      OpenSSL::HMAC.hexdigest(
        OpenSSL::Digest.new(ALGO),
        secret,
        to_sign
      )
    end

    private
    attr_reader :http_method, :url, :params

    def prepare!
      params.each do |k, v|
        encoded[percent_encode(k)] = percent_encode(v)
      end

      @to_sign = http_method.to_s.upcase + "&" + percent_encode(url)

      encoded.keys.sort.each do |key|
        @to_sign += "&#{key}=" + encoded[key]
      end
    end

    def percent_encode(v)
      return URI::escape(v.to_s.to_str, /[^a-zA-Z0-9\-\.\_\~]/)
    end
  end
end
