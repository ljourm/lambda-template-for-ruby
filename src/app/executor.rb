require './lib/config'
require './lib/app_logger'

module App
  class Executor
    include Lib::Config
    include Lib::AppLogger

    def initialize(event:, context:)
      @event = event
      @context = context
    end

    def execute
      logger.debug('executed')
      logger.debug(config[:common_message])
      logger.debug(config[:env_message])
    end
  end
end
