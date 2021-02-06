# frozen_string_literal: true

require_relative 'lib/mokara/version'

Gem::Specification.new do |spec|
  spec.name          = 'mokara'
  spec.version       = Mokara::VERSION
  spec.authors       = ['Adam Wead']
  spec.email         = ['awead@users.noreply.github.com']

  spec.summary       = 'An implementation of the Orcid API in Ruby'
  spec.description   = 'Implements the Orcid API specification in order to support Ruby applications wanting to ' \
                       'integrate with Orcid.'
  spec.homepage      = 'https://github.com/awead/mokara'
  spec.required_ruby_version = Gem::Requirement.new('>= 2.4.0')

  spec.metadata['homepage_uri'] = spec.homepage
  spec.metadata['source_code_uri'] = spec.homepage

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_dependency 'faraday', '~> 0.17'
end
