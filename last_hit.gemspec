# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'last_hit/version'

Gem::Specification.new do |spec|
  spec.name          = "last_hit"
  spec.version       = LastHit::VERSION
  spec.authors       = ["Duc Le"]
  spec.email         = ["leminhducktvn@gmail.com"]
  spec.summary       = %q{Help you to reduce the time waiting for the test servers by running some relevant tests before pushing}
  spec.description   = %q{You can run just relevant tests, fix them and pushing to the test servers}
  spec.homepage      = "https://github.com/lmduc/last_hit"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = ['last_hit']
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.1"

  spec.add_dependency 'thor', '~> 0.19.1'
end
