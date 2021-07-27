require 'dotenv'
require_relative 'runner/base'
require_relative 'implements/executor'

Dotenv.load

def lambda_handler(event:, context:)
  Runner.run(executor: Implements::Executor, event: event, context: context)
end

lambda_handler(event: {}, context: {}) if __FILE__ == $PROGRAM_NAME
