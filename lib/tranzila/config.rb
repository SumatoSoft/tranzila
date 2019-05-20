require 'active_support/configurable'

module Tranzila
  class Config
    include ::ActiveSupport::Configurable

    config_accessor :supplier, :tranzila_pw, :end_point, :credit_pass, :supplier_terminal

    def initialize(options = {})
      options.each do |key, value|
        config.send("#{key}=", value)
      end
    end

    def self.translations
      @translations = {}
      Dir[Rails.root.join('config', 'locales', 'tranzila', '**/*.{rb,yml}').to_s].each do |filename|
        @translations = @translations.merge(YAML.load_file(filename))
      end

      @translations
    end
  end
end
