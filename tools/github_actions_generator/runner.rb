require 'yaml'
require 'erb'
require '../../src/lib/utility/transform_keys_to_sym'

TEMPLATE_FILEPATH = './template.yml.erb'

erb = ERB.new(File.read(TEMPLATE_FILEPATH))
erb.filename = TEMPLATE_FILEPATH

Dir.glob('./config/environments/*.yml') do |filepath|
  common_config = YAML.load_file('config/common.yml')
  environment_config = YAML.load_file(filepath)

  @config = Utility.transform_keys_to_sym(common_config.merge(environment_config))

  output_filepath = "../../.github/workflows/deploy-to-#{@config[:env_name]}.yml"

  File.open(output_filepath, 'w+') do |f|
    f.write(erb.result)
  end
end
