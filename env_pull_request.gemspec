# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'env_pull_request/version'

Gem::Specification.new do |spec|
  spec.name          = 'env_pull_request'
  spec.version       = EnvPullRequest::VERSION
  spec.authors       = ['sanemat']
  spec.email         = ['o.gata.ken@gmail.com']

  spec.summary       =
    'Get PULL_REQUEST_ID from environment variables.'
  spec.description   =
    'Get PULL_REQUEST_ID from environment variables.'
  spec.homepage      =
    'https://github.com/packsaddle/ruby-env_pull_request'
  spec.license       = 'MIT'

  spec.files         =
    `git ls-files -z`
    .split("\x0")
    .reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = 'exe'
  spec.executables   =
    spec
    .files
    .grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_dependency 'natural_number_string'
  spec.add_development_dependency 'bundler'
  spec.add_development_dependency 'rake'
  spec.add_development_dependency 'test-unit'
end
