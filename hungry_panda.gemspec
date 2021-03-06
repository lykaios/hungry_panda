# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'hungry_panda/version'

Gem::Specification.new do |spec|
  spec.name          = "hungry_panda"
  spec.version       = HungryPanda::VERSION
  spec.authors       = ["Nate Allen"]
  spec.email         = ["nate.allen@workday.com"]
  spec.summary       = %q{Bamboo rest-client for API version 5}
  spec.description   = %q{}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.5"
  spec.add_development_dependency "rake"

  spec.add_development_dependency "rspec"
  spec.add_development_dependency "dotenv"
  
  spec.add_development_dependency "webmock"
  spec.add_development_dependency "vcr"
  
  spec.add_development_dependency "pry-rescue"
  spec.add_development_dependency "pry-debugger"
  spec.add_development_dependency "pry-stack_explorer"
  
  spec.add_runtime_dependency "rest-client"
end
