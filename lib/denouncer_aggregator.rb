require "denouncer_aggregator/version"
require 'logger'
require 'mongoid'
require 'logger'

module DenouncerAggregator
  autoload :Modules, File.expand_path('../denouncer_aggregator/modules', __FILE__)
  autoload :Models, File.expand_path('../denouncer_aggregator/models', __FILE__)

  DEFAULT_LOG_FILEPATH = '/tmp/denouncer_aggregator.log'
  DEFAULT_LOG_LEVEL = Logger::INFO
  @@logger = nil
  @@log_file = DEFAULT_LOG_FILEPATH
  @@log_level = DEFAULT_LOG_LEVEL

  def self.logger
    if @@logger.nil?
      @@logger = Logger.new(self.log_file)
      @@logger.level = self.log_level
    end
    @@logger
  end

  def self.log_file=(file_path)
    @@log_file = file_path
  end

  def self.log_file
    @@log_file
  end

  def self.log_level
    @@log_level
  end

  def self.log_level=(level)
    @@log_level = level
    self.logger.level = level
  end

  def self.init_configuration(config = {})
    self.log_file = config[:log_file] unless config[:log_file].nil?
    ::Mongoid.configure.connect_to("denouncer_aggregator")
    ::Mongoid.logger = self.logger
  end
end
