require "bundler/gem_tasks"
require "rspec/core/rake_task"

desc "Starts PRY with gem loaded"
task :console do
  sh "pry -I lib -r sjekksum --no-pager"
end

desc "Run all specs"
task RSpec::Core::RakeTask.new(:spec) do |t|
  t.pattern = "spec/**/*_spec.rb"
  t.verbose = false
end

task :default => :spec
