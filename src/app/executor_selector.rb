require './app/executor/sample_lambda_function_list'

module App
  class ExecutorSelector
    EXECUTORS = {
      # function_name(Symbol): executor(Class)
      'sample-lambda-function-list': App::Executor::SampleLambdaFunctionList,
    }.freeze

    def self.executor(function_name)
      key = function_name.to_sym

      raise "undefined executor '#{function_name}'" unless EXECUTORS.key?(key)

      EXECUTORS[key]
    end
  end
end
