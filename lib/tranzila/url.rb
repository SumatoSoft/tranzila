module Tranzila
  class Url
    def initialize(params = {})
      @params = params
    end

    def call
      "https://direct.tranzila.com/#{Tranzila.configuration.supplier}/iframe.php?#{@params.to_param}"
    end
  end
end
