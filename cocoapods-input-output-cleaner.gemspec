# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'cocoapods-input-output-cleaner/gem_version.rb'

Gem::Specification.new do |spec|
  spec.name          = 'cocoapods-input-output-cleaner'
  spec.version       = CocoapodsInputOutputCleaner::VERSION
  spec.authors       = ['青木']
  spec.email         = ['qingmu@2dfire.com']
  spec.description   = %q{A short description of cocoapods-input-output-cleaner.}
  spec.summary       = %q{A longer description of cocoapods-input-output-cleaner.}
  spec.homepage      = 'https://github.com/EXAMPLE/cocoapods-input-output-cleaner'
  spec.license       = 'MIT'

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 1.3'
  spec.add_development_dependency 'rake'
end
