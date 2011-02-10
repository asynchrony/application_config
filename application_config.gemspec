# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)

Gem::Specification.new do |s|
  s.name = "application_config"
  s.version = '0.0.2'
  s.platform = Gem::Platform::RUBY
  s.authors = ["kenny ortmann", "mike gaffney", "nick bimpasis"]
  s.email = ['kenny.ortmann@gmail.com']
  s.homepage = "https://github.com/asynchrony/application_config"
  s.summary = %q{a gem that you can use for application specific settings}
  s.description = %q{a gem that you can use for application specific settings}

  s.files = `git ls-files`.split("\n")
  s.test_files = `git ls-files -- {test}/*`.split("\n")
  s.executables = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
end