require "bundler/gem_tasks"
require "rspec/core/rake_task"

RSpec::Core::RakeTask.new(:spec)

task :default => :mock

task :mock do
  ENV['FOG_MOCK'] = "true"
  Rake::Task[:spec].invoke
end

task :real do
  ENV['FOG_MOCK'] = "false"
  Rake::Task[:spec].invoke
end
