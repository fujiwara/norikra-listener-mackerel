require 'mackerel/client'
require 'tilt/erubis' # tilt autoloading 'tilt/erubis' in a non thread-safe way; explicit require 'tilt/erubis' suggested.

require 'norikra/logger'
require 'norikra/listener'
include Norikra::Log

module Norikra
  module Listener
    class Mackerel < Norikra::Listener::Base
      def self.label
        'MACKEREL'
      end

      def initialize(argument, query_name, query_group)
        super
        @service, api_key = argument.split(',', 2)
        api_key ||= ENV['MACKEREL_APIKEY']

        raise Norikra::ArgumentError, "service name is not specified" unless @service
        raise Norikra::ArgumentError, "api_key is not specified" unless api_key

        @client = ::Mackerel::Client.new(:mackerel_api_key => api_key)
        debug "Initialized mackerel-client api_key:#{api_key}"
      end

      def process_async(events)
        metrics = []
        events.each do |time, record|
          record.each do |k, v|
            metrics.push({ time: time.to_i, name: k, value: v })
          end
        end
        debug "post_service_metriccs(#{@service}, #{metrics})"
        begin
          @client.post_service_metrics(@service, metrics)
        rescue => e
          warn "post_service_metrics failed #{e}"
        end
      end

    end
  end
end
