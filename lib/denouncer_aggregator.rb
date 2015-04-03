require "denouncer_aggregator/version"
require 'logger'
require 'mongoid'

module DenouncerAggregator
  autoload :Modules, File.expand_path('../denouncer_aggregator/modules', __FILE__)
  autoload :Models, File.expand_path('../denouncer_aggregator/models', __FILE__)

  DEFAULT_LOG_FILEPATH = '/tmp/denouncer_aggregator.log'
  @@logger = nil

  def self.logger
    if @@logger.nil?
      @@logger = Logger.new(DEFAULT_LOG_FILEPATH)
    end
    @@logger
  end

  def self.init_configuration
    ::Mongoid.configure.connect_to("denouncer_aggregator")
  end
end
