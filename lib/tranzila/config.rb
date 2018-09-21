require 'active_support/configurable'

module Tranzila
  class Config
    include ::ActiveSupport::Configurable

    config_accessor :supplier, :tranzila_pw, :end_point, :credit_pass

    def initialize(options = {})
      options.each do |key, value|
        config.send("#{key}=", value)
      end
    end
  end
end
