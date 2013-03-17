# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'manywords/version'

Gem::Specification.new do |spec|
  spec.name          = "manywords"
  spec.version       = Manywords::VERSION
  spec.authors       = ["Stephen H. Gerstacker"]
  spec.email         = ["stephen@shortround.net"]
  spec.description   = %q{Discover words in random letters}
  spec.summary       = %q{Given a set of random letters, find all of the words in it}
  spec.homepage      = "http://shortround.net"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"

  spec.add_dependency "methadone", "~> 1.2.6"

  spec.required_ruby_version = '>= 2.0.0'
end
