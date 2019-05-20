module Tranzila
  class Charge < Base
    def permitted_params
      %I[
        expdate
        TranzilaTK
        sum
        currency
        cred_type
        tranmode
      ].freeze
    end

    def default_params
      {
        supplier: Tranzila.configuration.supplier,
        TranzilaPW: Tranzila.configuration.tranzila_pw
      }
    end

    def call
      result = URI.decode_www_form(request).to_h
      if result['Response'].nil?
        raise('Something went wrong')
      elsif result['Response'] != '000'
        raise(result['Response'])
      end
      result
    end
  end
end
