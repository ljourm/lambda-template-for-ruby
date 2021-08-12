require './lib/app/runner'

def lambda_handler(event:, context:)
  App::Runner.run(event: event, context: context)
end

if __FILE__ == $PROGRAM_NAME
  require 'dotenv/load'

  lambda_context_mock = Class.new do
    def function_name
      ENV['FUNCTION_NAME']
    end
  end

  lambda_handler(event: {}, context: lambda_context_mock.new)
end
