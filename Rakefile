require "bundler/gem_tasks"
require "rspec/core/rake_task"

RSpec::Core::RakeTask.new(:serverspec)

ENV["DOCKER_IMAGE"] = "itamae-plugin:latest"
ENV["IMAGE"] ||= "debian:buster"

desc "Run itamae"
task :itamae do
  sh "itamae docker --node-yaml=spec/recipes/node.yml spec/recipes/install.rb --image=#{ENV["IMAGE"]} --tag #{ENV["DOCKER_IMAGE"]}"
end

desc "Run test"
task :test => %i(itamae serverspec)

task default: :test
