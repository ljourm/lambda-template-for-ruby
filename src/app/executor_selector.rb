require './app/sample_executor'

module App
  class ExecutorSelector
    EXECUTORS = {
      # function_name(Symbol): executor(Class)
      'sample-function': App::SampleExecutor,
    }.freeze

    def self.executor(function_name)
      EXECUTORS[function_name.to_sym]
    end
  end
end
