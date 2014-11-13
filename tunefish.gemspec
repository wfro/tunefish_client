# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'tunefish/version'

Gem::Specification.new do |spec|
  spec.name          = "tunefish"
  spec.version       = Tunefish::VERSION
  spec.authors       = ["Will Faurot"]
  spec.email         = ["wfaurot@gmail.com"]
  spec.summary       = "Client for the Tunefish RESTful API."
  spec.description   = ""
  spec.homepage      = "http://tunefi.sh"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.6"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "minitest"
  spec.add_development_dependency "webmock"
  spec.add_development_dependency "vcr"
  spec.add_dependency "faraday"
  spec.add_dependency "json"
end
