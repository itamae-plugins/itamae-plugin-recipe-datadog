# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'itamae/plugin/recipe/datadog/version'

Gem::Specification.new do |spec|
  spec.name          = "itamae-plugin-recipe-datadog"
  spec.version       = Itamae::Plugin::Recipe::Datadog::VERSION
  spec.authors       = ["Takahiro Kiso (takanamito)", "sue445", "Speee, Inc."]
  spec.email         = ["t.kiso0928@gmail.com", "sue445@sue445.net"]

  spec.summary       = %q{Itamae plugin to install datadog-agent.}
  spec.description   = %q{Itamae plugin to install datadog-agent.}
  spec.homepage      = "https://github.com/itamae-plugins/itamae-plugin-recipe-datadog"
  spec.license       = "MIT"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = spec.homepage
  spec.metadata["changelog_uri"] = "#{spec.homepage}/blob/master/CHANGELOG.md"
  spec.metadata["rubygems_mfa_required"] = "true"

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "itamae"

  spec.add_development_dependency "bundler"
  spec.add_development_dependency "docker-api"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency "serverspec"
end
