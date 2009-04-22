require 'application_config'
require 'application_config/data_structures/always_null_node'
require 'application_config/data_structures/nested_hash'
require 'application_config/data_structures/value_node'
begin
  config = ApplicationConfig.new
  [RAILS_ROOT +  "/config/application.yml", RAILS_ROOT + "/config/environments/application-#{RAILS_ENV}.yml"].each do |config_file|
    next unless File.exists?(config_file)
    config.add(ERB.new(IO.read(config_file)).result)
  end
  ApplicationConfig.singleton(config)
end


class ActiveSupport::TestCase
  teardown :reset_application_config

  def reset_application_config
    ApplicationConfig.reset_config_after_test
  end
end