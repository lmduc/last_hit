# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'last_hit/version'

Gem::Specification.new do |spec|
  spec.name          = "last_hit"
  spec.version       = LastHit::VERSION
  spec.authors       = ["Duc Le"]
  spec.email         = ["leminhducktvn@gmail.com"]
  spec.summary       = %q{Help you to run relevant tests}
  spec.description   = %q{Working with GIT}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.1"
end
