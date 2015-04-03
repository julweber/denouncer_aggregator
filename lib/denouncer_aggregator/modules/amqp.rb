require 'bunny'
require 'json'

module DenouncerAggregator
  module Modules
    class Amqp
      DEFAULT_PORT = 5672
      DEFAULT_SERVER = 'localhost'
      DEFAULT_VHOST = '/'
      DEFAULT_USERNAME = 'guest'
      DEFAULT_PASSWORD = 'guest'

      def initialize(config = {})
        @config = config
        connection
        queues
        channel
        exchange
      end

      def config
        @config
      end

      def initialize_queues(queue_names)
        queue_names.each do |q|
          queue q
        end
        queues
      end

      def fetch_notifications
        messages = Array.new
        queues.each do |k,q|
          if q.message_count > 0
            q.subscribe do |delivery_info, metadata, payload|
              msg_hash = JSON.parse(payload)
              DenouncerAggregator.logger.info "Queue: #{k} - Msg: #{msg_hash['error_message']}"
              m = DenouncerAggregator::Models::Message.create msg_hash
              messages << m
            end
          end
        end
        messages
      end

      private

      def exchange
        @exchange = channel.default_exchange if @exchange.nil?
        @exchange
      end

      def connection
        if @con.nil?
          config[:server] = DEFAULT_SERVER if config[:server].nil?
          config[:port] = DEFAULT_PORT if config[:port].nil?
          config[:vhost] = DEFAULT_VHOST if config[:vhost].nil?
          config[:username] = DEFAULT_USERNAME if config[:username].nil?
          config[:password] = DEFAULT_PASSWORD if config[:password].nil?

          connection_hash = {
            host: config[:server],
            vhost: config[:vhost],
            port: config[:port],
            username: config[:username],
            password: config[:password],
            threaded: true
          }
          @con = Bunny.new connection_hash
          @con.start
        end
        @con
      end

      def channel
        @channel = connection.create_channel if @channel.nil?
        @channel
      end

      def queue(name)
        queues[name] = channel.queue(name) if queues[name].nil?
        queues[name]
      end

      def queues
        @queues = Hash.new if @queues.nil?
        @queues
      end
    end
  end
end
