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
  s.description = %q{This gem maps to a swagger API}
  s.license     = "Apache-2.0"

  s.add_runtime_dependency 'httparty', '0.20.0'
  s.add_runtime_dependency 'json', '~> 2.1', '>= 2.1.0'

  s.add_development_dependency 'rspec', '~> 3.6', '>= 3.6.0'
  s.add_development_dependency 'vcr', '~> 3.0', '>= 3.0.1'
  s.add_development_dependency 'webmock', '~> 1.24', '>= 1.24.3'
  s.add_development_dependency 'autotest', '~> 4.4', '>= 4.4.6'
  s.add_development_dependency 'autotest-rails-pure', '~> 4.1', '>= 4.1.2'
  s.add_development_dependency 'autotest-growl', '~> 0.2', '>= 0.2.16'
  s.add_development_dependency 'autotest-fsevent', '~> 0.2', '>= 0.2.12'

  s.files         = `find *`.split("\n").uniq.sort.select{|f| !f.empty? }
  s.test_files    = `find spec/*`.split("\n")
  s.executables   = []
  s.require_paths = ["lib"]
end
