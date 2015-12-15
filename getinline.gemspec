# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'getinline/version'

Gem::Specification.new do |spec|
  spec.name          = 'getinline'
  spec.version       = Getinline::VERSION
  spec.authors       = ['Jeremy Kahn', 'Travis Pennetti']
  spec.email         = ['jeremy@jellyvision.com', 'tpennetti@jellyvision.com']

  spec.summary       = 'Inlines CSS styles for HTML email development'
  spec.description   = 'Inlines CSS styles for HTML email development and preserves ERB tags'
  spec.homepage      = 'https://github.com/jellyvision/getinline'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 1.10'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rspec'
  spec.add_runtime_dependency 'premailer', '1.8.6'
  spec.add_runtime_dependency 'nokogiri', '1.6.7'
end
