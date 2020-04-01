module Tranzila
  class Url
    def initialize(params = {}, supplier_terminal = nil)
      @params = params
      @supplier_terminal = supplier_terminal || Tranzila.configuration.supplier
    end

    def call
      "https://direct.tranzila.com/#{@supplier_terminal}/iframe.php?#{@params.to_param}"
    end
  end
end
