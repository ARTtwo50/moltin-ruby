# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'moltin/version'

Gem::Specification.new do |spec|
  spec.name          = "moltin"
  spec.version       = Moltin::VERSION
  spec.authors       = ["sfkaos"]
  spec.email         = ["win.raguini@gmail.com"]
  spec.summary       = "This is an API wrapper for Moltin"
  spec.description   = "An API wrapper for moltin"
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "webmock", '~> 1.20'
  spec.add_development_dependency "rspec"

  spec.add_dependency "byebug"
  spec.add_dependency "faraday_middleware", '~> 0.9'
  spec.add_dependency "oauth2"
  spec.add_dependency 'multi_json', '~> 1.0'
end
