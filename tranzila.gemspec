lib = File.expand_path('lib', __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'tranzila/version'

Gem::Specification.new do |spec|
  spec.name          = 'tranzila'
  spec.version       = Tranzila::VERSION
  spec.authors       = ['Yuri Zubov']
  spec.email         = ['y.zubov@sumatosoft.com']

  spec.summary       = 'dasdasd'
  spec.description   = 'Tasdasdasd'
  spec.homepage      = 'https://github.com/SumatoSoft/tranzila'
  spec.license       = 'MIT'

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']
  
  spec.add_development_dependency 'bundler', '~> 1.16'
  spec.add_development_dependency 'pry'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rspec', '~> 3.7'
  spec.add_development_dependency 'rspec-mocks', '~> 3.7'
  spec.add_development_dependency 'rubocop', '~> 0.51'
  spec.add_runtime_dependency 'activesupport', '>= 4.2'
end
