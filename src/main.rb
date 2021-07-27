require 'dotenv'
require_relative 'runner/base'
require_relative 'app/executor'

Dotenv.load

def lambda_handler(event:, context:)
  Runner.run(executor: App::Executor, event: event, context: context)
end

lambda_handler(event: {}, context: {}) if __FILE__ == $PROGRAM_NAME
