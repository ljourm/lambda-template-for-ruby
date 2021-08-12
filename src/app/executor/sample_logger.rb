require './lib/app/executor/base'

module App
  module Executor
    class SampleLogger < Base
      def execute
        logger.debug('executed')
        logger.debug(config[:common_message])
        logger.debug(config[:env_message])
      end
    end
  end
end
