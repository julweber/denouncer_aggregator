# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'denouncer_aggregator/version'

Gem::Specification.new do |spec|
  spec.name          = "denouncer_aggregator"
  spec.version       = DenouncerAggregator::VERSION
  spec.authors       = ["Julian Weber"]
  spec.email         = ["jweber@anynines.com"]
  spec.summary       = %q{TODO: Write a short summary. Required.}
  spec.description   = %q{TODO: Write a longer description. Optional.}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", ">= 1.6"
  spec.add_development_dependency "rspec"
  spec.add_development_dependency "rake", ">= 10.0"
  spec.add_development_dependency "pry"
  spec.add_development_dependency "simplecov"

  spec.add_dependency "bunny"
  spec.add_dependency "daemons"
  spec.add_dependency "mongoid"

end
