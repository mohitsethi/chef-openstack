require 'rubygems'
require 'bundler/setup'
require 'rubocop/rake_task'
require 'foodcritic'
require 'rspec/core/rake_task'
require 'kitchen'

FoodCritic::Rake::LintTask.new do |t|
  t.options = { 'fail_tags' => ['correctness'] }
end
RuboCop::RakeTask.new

# Added ChefSpec task
RSpec::Core::RakeTask.new(:chefspec)

# Immediately sync all stdout so that tools like buildbot can
# immediately load in the output.
$stdout.sync = true
$stderr.sync = true
#
# # Change to the directory of this file.
Dir.chdir(File.expand_path('../', __FILE__))

desc 'Run Test Kitchen integration tests'
task :integration do
  Kitchen.logger = Kitchen.default_file_logger
  Kitchen::Config.new.instances.each do |instance|
    instance.test(:always)
  end
end

desc 'Run all test'
task :test => [:chefspec, :integration]

task 'default' => [:test]
