module ApplicationConfig
	class Base
		@@application_config = nil
  
    def [](key)
      return @config[key] if @config
      nil
    end
  
    def add(config_text)
      if @config
        @config.merge!(YAML::load(config_text))
      else
        @config = ApplicationConfig::DataStructures::NestedHash.new(YAML::load(config_text))
      end
    end
  
    def self.singleton(application_config)
      @@application_config ||= application_config
    end
  
    def self.[](key)
      @@application_config[key]
    end
    
    def method_missing(method_name)
      self[method_name.to_s]
    end
    
    def self.method_missing(method_name)
      self[method_name.to_s]
    end
	end
end