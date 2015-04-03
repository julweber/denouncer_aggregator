require 'mongoid'

module DenouncerAggregator
  module Models
    class Message
      include Mongoid::Document
      include Mongoid::Attributes::Dynamic
    end
  end
end
