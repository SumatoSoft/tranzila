require 'net/http'

module Tranzila
  class Refund < Base
    def call
      result = URI.decode_www_form(request).to_h
      if result['Response'].nil?
        raise('Something went wrong')
      elsif result['Response'] != '000'
        raise(result['Response'])
      end
      result
    end

    def permitted_params
      %I[
        tranmode
        authnr
        TranzilaTK
        sum
      ].freeze
    end

    private

    def default_params
      {
        supplier: Tranzila.configuration.supplier_terminal,
        TranzilaPW: Tranzila.configuration.tranzila_pw,
        CreditPass: Tranzila.configuration.credit_pass
      }
    end
  end
end
