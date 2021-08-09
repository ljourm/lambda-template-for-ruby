require './lib/config'
require './lib/app_logger'
require './app/executor_selector'

class Runner
  include Lib::Config
  include Lib::AppLogger

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

def lambda_handler(event:, context:)
  Runner.run(event: event, context: context)
end

if __FILE__ == $PROGRAM_NAME
  lambda_context_mock = Class.new do
    def function_name
      'sample-function'
    end
  end

  lambda_handler(event: {}, context: lambda_context_mock.new)
end
