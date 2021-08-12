require './lib/app/config'
require './lib/app/app_logger'
require './app/executor_selector'

module App
  class Runner
    include App::Config
    include App::AppLogger

    class << self
      def run(event:, context:)
        Runner.new(event: event, context: context).run
      end
    end

    def initialize(event:, context:)
      @event = event
      @context = context
    end

    def run
      output_debug_logs

      executor.execute

      logger.info(message: 'success')

      { status: 'success' }
    rescue StandardError => e
      logger.info(message: 'error')
      logger.error(message: e.message, backtrace: e.backtrace)

      { status: 'failure' }
    end

    private

    def executor
      App::ExecutorSelector.executor(@context.function_name).new(event: @event, context: @context)
    end

    def output_debug_logs
      logger.debug({ content: 'APP_ENV', body: ENV['APP_ENV'] })
      logger.debug({ content: 'config', body: config })
      logger.debug({ content: 'event', body: @event })
    end
  end
end
