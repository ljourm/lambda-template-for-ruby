require 'yaml'
require 'erb'

TEMPLATE_FILEPATH = './template.yml.erb'

erb = ERB.new(File.read(TEMPLATE_FILEPATH))
erb.filename = TEMPLATE_FILEPATH

Dir.glob('./config/environments/*.yml') do |filepath|
  common_config = YAML.load_file('config/common.yml').transform_keys(&:to_sym)
  environment_config = YAML.load_file(filepath).transform_keys(&:to_sym)

  @config = common_config.merge(environment_config)

  output_filepath = "../../.github/workflows/deploy-to-#{@config[:env_name]}.yml"

  File.open(output_filepath, 'w+') do |f|
    f.write(erb.result)
  end
end
