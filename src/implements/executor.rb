module Implements
  class Executor
    def initialize(config:, event:, context:)
      @config = config
      @event = event
      @context = context
    end

    def execute
      Runner.logger.debug('executed')
      Runner.logger.debug(@config[:common_message])
      Runner.logger.debug(@config[:env_message])
    end
  end
end
