require 'active_support/configurable'

module Tranzila
  class Config
    include ::ActiveSupport::Configurable

    config_accessor :supplier, :tranzila_pw, :end_point, :credit_pass

    def initialize(options = {})
      options.each do |key, value|
        config.send("#{key}=", value)
      end

      I18n.load_path << Dir[File.expand_path('./config/locales/**/*.yml')]
      I18n.available_locales = %i[en he]
    end
  end
end
