require "bundler/gem_tasks"
require "rspec/core/rake_task"

RSpec::Core::RakeTask.new(:serverspec)

ENV["TEST_IMAGE"] = "itamae-plugin:latest"
ENV["SOURCE_IMAGE"] ||= "debian:buster"

desc "Run itamae"
task :itamae do
  sh "itamae docker --node-yaml=spec/recipes/node.yml spec/recipes/install.rb --image=#{ENV["SOURCE_IMAGE"]} --tag #{ENV["TEST_IMAGE"]}"
end

desc "Run test"
task :test => %i(itamae serverspec)

task default: :test
