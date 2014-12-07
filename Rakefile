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

namespace :inch do
  desc "List all objects with there results"
  task :list do
    sh "inch list --all"
  end

  desc "Print stats about the documentation state"
  task :stats do
    sh "inch stats"
  end
end

desc "inch documentation report (`list` and `stats`)"
task inch: ["inch:list", "inch:stats"]

task :default => :spec
