module ApplicationConfig
  class Base
    @@orig = nil
  
    def self.reset_config_after_test
      if @@orig
        @@application_config = @@orig.dup
      end
    end
  
    def self.add(config_text_yml)
      unless @@orig
        @@orig = @@application_config.dup
      end
      @@application_config.add(config_text_yml)
    end
  
    def dup
      new_config = ApplicationConfig::Base.new
      new_config.config = @config.dup
      new_config
    end
  
    protected
  
    def config=(config)
      @config = config
    end
  end
end

class ActiveSupport::TestCase
  teardown :reset_application_config

  def reset_application_config
    ApplicationConfig::Base.reset_config_after_test
  end
end