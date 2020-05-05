# frozen_string_literal: true

Gem::Specification.new do |spec|
  spec.name          = 'lita-devops'
  spec.version       = '1.0.0'
  spec.authors       = ['DevOps']
  spec.email         = ['root@devops.com']
  spec.description   = 'devops chatops bot'
  spec.summary       = 'chatops bot'
  spec.homepage      = 'https://devops.com'
  spec.license       = 'MIT'
  spec.metadata      = { 'lita_plugin_type' => 'handler' }

  spec.files         = `git ls-files`.split($INPUT_RECORD_SEPARATOR)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.add_runtime_dependency 'lita', '>= 4.7.1'

  spec.add_development_dependency 'bundler', '~> 1.17'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rspec', '~> 3.0'
end
