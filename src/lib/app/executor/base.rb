require './lib/app/config'
require './lib/app/app_logger'

module App
  module Executor
    class Base
      include App::Config
      include App::AppLogger

      def initialize(event:, context:)
        @event = event
        @context = context
      end
    end
  end
end
