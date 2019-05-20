module Tranzila
  class Base
    def initialize(params = {})
      @params = prepare_params(params)
    end

    def call
      raise('Must be overrided')
    end

    def base_url
      Tranzila.configuration.end_point || 'https://secure5.tranzila.com/cgi-bin/tranzila71u.cgi'.freeze
    end

    def permitted_params
      raise('Must be overrided')
    end

    protected

    def prepare_params(params)
      params.
        slice(*permitted_params).
        merge(default_params) { |_, important, _| important }
    end

    def request
      url = URI(base_url)
      responce = Net::HTTP.post_form(url, @params)
      raise('Something went wrong') if responce.code != '200'
      doc = Nokogiri::HTML(responce.body)
      message = doc.css('[color="red"]').first&.text
      raise(message) if message
      responce.body
    end
  end
end
