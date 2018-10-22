require 'tranzila/config'
require 'tranzila/base'
require 'tranzila/charge'
require 'tranzila/token'
require 'tranzila/refund'
require 'tranzila/url'
require 'tranzila/version'

module Tranzila
  def self.configuration
    @configuration ||= Config.new
  end

  def self.config
    config = configuration
    yield(config)
  end
end
