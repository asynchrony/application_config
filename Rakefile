require 'bundler'
Bundler::GemHelper.install_tasks

require 'minitest/unit'

desc 'Run all tests'
task :test do
  ENV['QUIET'] ||= 'true'

  $LOAD_PATH.unshift(File.expand_path(File.dirname(__FILE__) + '/test'))
  $LOAD_PATH.unshift(File.expand_path(File.dirname(__FILE__)))

  MiniTest::Unit.autorun

  test_files = Dir['test/**/*_test.rb']
  test_files.each { |f| require f }
end

task :default => :test