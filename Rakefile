require 'bundler/gem_tasks'
require 'rspec/core/rake_task'

# Integrate Rubocop if available
begin
  require 'rubocop/rake_task'

  RuboCop::RakeTask.new
  task(:default).prerequisites << task(:rubocop)
rescue LoadError
  task :rubocop do
    puts 'Install rubocop to run its rake tasks'
  end
end

RSpec::Core::RakeTask.new(:spec) do |r|
  r.pattern = FileList['**/**/*_spec.rb']
end
