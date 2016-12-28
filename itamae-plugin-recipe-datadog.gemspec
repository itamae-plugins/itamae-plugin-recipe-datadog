# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'itamae/plugin/recipe/datadog/version'

Gem::Specification.new do |spec|
  spec.name          = "itamae-plugin-recipe-datadog"
  spec.version       = Itamae::Plugin::Recipe::Datadog::VERSION
  spec.authors       = ["Takahiro Kiso (takanamito)"]
  spec.email         = ["t.kiso0928@gmail.com"]

  spec.summary       = %q{Itamae plugin to install datadog-agent.}
  spec.description   = %q{Itamae plugin to install datadog-agent.}
  spec.homepage      = "TODO: Put your gem's website or public repo URL here."
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.13"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
end
