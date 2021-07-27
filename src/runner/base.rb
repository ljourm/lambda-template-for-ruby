require 'json'
require './lib/base'

module Runner
  class << self
    def run(executor:, event:, context:)
      hashed_event = event.transform_keys(&:to_sym)
      hashed_context = context.transform_keys(&:to_sym)

      output_debug_logs(hashed_event, hashed_context)

      executor.new(event: hashed_event, context: hashed_context).execute

      logger.info(message: 'success')

      { status: 'success' }
    rescue StandardError => e
      logger.info(message: 'error')
      logger.error(message: e.message, backtrace: e.backtrace)

      { status: 'failure' }
    end

    private

    def output_debug_logs(hashed_event, hashed_context)
      logger.debug({ content: 'APP_ENV', body: ENV['APP_ENV'] })
      logger.debug({ content: 'config', body: config })
      logger.debug({ content: 'event args', body: hashed_event })
      logger.debug({ content: 'context args', body: hashed_context })
    end

    def config
      Lib.config
    end

    def logger
      Lib.logger
    end
  end
end
