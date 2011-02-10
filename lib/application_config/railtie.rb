module Rails
	module ApplicationConfig
		class Railtie < Rails::Railtie
			initializer "setup config" do
				begin
				  config = ::ApplicationConfig::Base.new
				  [Rails.root.join("config", "application.yml"), Rails.root.join("config", "environments", "application-#{Rails.env.to_s}.yml")].each do |config_file|
				    next unless config_file.file?
				    read = IO.read(config_file)
				    erb_result = ERB.new(read).result
				    config.add(erb_result)
				  end
				  ::ApplicationConfig::Base.singleton(config)
				end
			end
		end
	end
end


