require 'json'
require './lib/config'
require './lib/app_logger'

class Runner
  include Lib::Config
  include Lib::AppLogger

  class << self
    def run(executor:, event:, context:)
      Runner.new(executor).run(event, context)
    end
  end

  def initialize(executor)
    @executor = executor
  end

  def run(event, context)
    hashed_event = event.transform_keys(&:to_sym)

    output_debug_logs(hashed_event)

    @executor.new(event: hashed_event, context: context).execute

    logger.info(message: 'success')

    { status: 'success' }
  rescue StandardError => e
    logger.info(message: 'error')
    logger.error(message: e.message, backtrace: e.backtrace)

    { status: 'failure' }
  end

  private

  def output_debug_logs(hashed_event)
    logger.debug({ content: 'APP_ENV', body: ENV['APP_ENV'] })
    logger.debug({ content: 'config', body: config })
    logger.debug({ content: 'event args', body: hashed_event })
  end
end
