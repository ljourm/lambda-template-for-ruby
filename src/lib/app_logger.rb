require 'logger'
require './lib/config'

module Lib
  module AppLogger
    class << self
      APPLICATION_CONFIG_FILENAME = 'config/application.yml'.freeze

      def logger
        @logger ||= Logger.new($stdout, level: config[:log_level] || 'INFO')
      end

      private

      def config
        Lib::Config.config
      end
    end

    def logger
      Lib::AppLogger.logger
    end
  end
end
