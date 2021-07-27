require 'logger'
require 'yaml'

module Lib
  class << self
    APPLICATION_CONFIG_FILENAME = 'config/application.yml'.freeze

    def logger
      @logger ||= Logger.new($stdout, level: Lib.config[:log_level] || 'INFO')
    end

    def config
      @config unless @config.nil?

      application_config = YAML.load_file(application_config_filename)
      environment_config = YAML.load_file(environment_config_filename)

      @config = application_config.merge(environment_config).transform_keys(&:to_sym)
    end

    private

    def application_config_filename
      APPLICATION_CONFIG_FILENAME
    end

    def environment_config_filename
      "config/environments/#{ENV['APP_ENV']}.yml"
    end
  end
end
