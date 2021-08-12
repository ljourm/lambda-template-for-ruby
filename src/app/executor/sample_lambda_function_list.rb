require 'aws-sdk-lambda'
require './lib/app/executor/base'

module App
  module Executor
    class SampleLambdaFunctionList < Base
      def execute
        logger.debug('lambda function list')

        output_config_message

        lambda_client.list_functions.functions.each do |function|
          logger.debug("Name: #{function.function_name}")
        end
      end

      private

      def output_config_message
        logger.debug(config[:common_message])
        logger.debug(config[:env_message])
      end

      def lambda_client
        @lambda_client ||= Aws::Lambda::Client.new(region: config[:region], stub_responses: stub_responses)
      end

      def stub_responses
        false
      end
    end
  end
end
