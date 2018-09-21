require 'net/http'

module Tranzila
  class Token < Base
    def call
      responce = request.strip
      result = URI.decode_www_form(responce).to_h
      raise('Something went wrong') unless result['TranzilaTK']
      result['TranzilaTK']
    end

    def permitted_params
      %I[
        ccno
      ].freeze
    end

    private

    def default_params
      {
        supplier: Tranzila.configuration.supplier,
        TranzilaPW: Tranzila.configuration.tranzila_pw,
        TranzilaTK: 1
      }
    end
  end
end
