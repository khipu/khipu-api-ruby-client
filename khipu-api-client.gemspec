# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "khipu-api-client/version"

Gem::Specification.new do |s|
  s.name        = "khipu-api-client"
  s.version     = Khipu::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["khipu"]
  s.email       = ["developers@khipu.com"]
  s.homepage    = "https://github.com/khipu/khipu-api-ruby-client"
  s.summary     = %q{A ruby wrapper for the khipu APIs}
    s.license     = "Apache-2.0"

  s.add_runtime_dependency 'typhoeus', '~> 0.2', '>= 0.2.1'
  s.add_runtime_dependency 'json', '~> 1.4', '>= 1.4.6'

  s.add_development_dependency 'rspec', '~> 3.2', '>= 3.2.0'
  s.add_development_dependency 'webmock', '~> 1.6', '>= 1.6.2'
  s.add_development_dependency 'byebug'

  s.files         = `find *`.split("\n").uniq.sort.select{|f| !f.empty? }
  s.test_files    = `find spec/*`.split("\n")
  s.executables   = []
  s.require_paths = ["lib"]
end
