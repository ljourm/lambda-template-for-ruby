require 'logger'
require './lib/app/config'

module App
  module AppLogger
    class << self
      APPLICATION_CONFIG_FILENAME = 'config/application.yml'.freeze

      def logger
        @logger ||= Logger.new($stdout, level: config[:log_level] || 'INFO')
      end

      private

      def config
        App::Config.config
      end
    end

    def logger
      App::AppLogger.logger
    end
  end
end
