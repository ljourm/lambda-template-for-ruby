require './lib/base'

module App
  class Executor
    def initialize(event:, context:)
      @event = event
      @context = context
    end

    def execute
      logger.debug('executed')
      logger.debug(config[:common_message])
      logger.debug(config[:env_message])
    end

    private

    def config
      Lib.config
    end

    def logger
      Lib.logger
    end
  end
end
