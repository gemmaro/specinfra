# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'specinfra/version'

Gem::Specification.new do |spec|
  spec.name          = "specinfra"
  spec.version       = Specinfra::VERSION
  spec.authors       = ["Gosuke Miyashita"]
  spec.email         = ["gosukenator@gmail.com"]
  spec.description   = %q{Common layer for serverspec and itamae}
  spec.summary       = %q{Common layer for serverspec and itamae}
  spec.homepage      = 'https://github.com/mizzy/specinfra'
  spec.license       = "MIT"

  spec.files         = %w{LICENSE.txt README.md} + `git ls-files`.split("\n").select { |f| f =~ %r{^(?:lib/)}i }
  spec.test_files    = %w{Gemfile specinfra.gemspec Rakefile} + `git ls-files`.split("\n").select { |f| f =~ %r{^(?:spec/)}i }
  spec.require_paths = ["lib"]
  # TODO: at some point pin to a minumum version of ruby to reduce support burden in a major version bump
  # spec.required_ruby_version  = '>= 2.3.0'

  spec.add_runtime_dependency "net-scp"
  spec.add_runtime_dependency "net-ssh", ">= 2.7"
  spec.add_runtime_dependency "net-telnet", *(Specinfra.ruby_is_older_than?(2, 3, 0) ? ["0.1.1"] : [])
  spec.add_runtime_dependency "sfl" if Specinfra.ruby_is_older_than?(1, 9, 0)

  spec.add_development_dependency "rake", "~> 10.1.1"
  spec.add_development_dependency "rspec"
  spec.add_development_dependency "rspec-its"
end
