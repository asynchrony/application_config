require 'application_config'
require 'application_config/data_structures/always_null_node'
require 'application_config/data_structures/nested_hash'
require 'application_config/data_structures/value_node'

begin
  config = ApplicationConfig.new

  ["/config/application.yml", "/config/environments/application-#{Rails.env}.yml"].each do |config_file|
    file_loc = File.join(Rails.root, config_file)
    next unless File.exists?(file_loc)
    config.add(ERB.new(IO.read(file_loc)).result)
  end
  ApplicationConfig.singleton(config)
end
