# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'esperanza/version'

Gem::Specification.new do |spec|
  spec.name          = "esperanza"
  spec.version       = Esperanza::VERSION
  spec.authors       = ["your"]
  spec.email         = ["g.lobraico@gmail.com"]

  spec.summary       = "Esperanza, because words do not really matter sometimes."
  spec.description   = "Esperanza is the last resort for everyday human language misunderstandings."
  spec.homepage      = "http://github.com/your/esperanza"
  spec.license       = "MIT"

  # Prevent pushing this gem to RubyGems.org by setting 'allowed_push_host', or
  # delete this section to allow pushing this gem to any host.
  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = "TODO: Set to 'http://mygemserver.com'"
  else
    raise "RubyGems 2.0 or newer is required to protect against public gem pushes."
  end

  spec.files = Dir['lib/**/*.rb']
  spec.require_path = 'lib'

  spec.add_development_dependency "bundler", "~> 1.10"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec"
  spec.add_development_dependency "rspec-nc"
  spec.add_development_dependency "guard"
  spec.add_development_dependency "guard-rspec"
  spec.add_development_dependency "webmock"
  spec.add_development_dependency "vcr"
  spec.add_development_dependency "nokogiri"
end
