# coding: utf-8
lib = File.expand_path('../lib', __FILE__) 
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib) 
require 'sms_gateway/version' 

Gem::Specification.new do |spec| 
  spec.name        = "sms_gateway" 
  spec.version     = SMSGateway::Version
  spec.authors     = ["Nerio Navea"]
  spec.email       = ["neriojose5@gmail.com"]
  spec.description = %q{A Ruby implementation of https://smsgateway.me/ API}
  spec.summary     = %q{Deliver SMS with https://smsgateway.me/} 
  spec.homepage    = "" 
  spec.license     = "MIT" 

  spec.files       = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependecy = 'net/http' 

  spec.add_development_dependency 'bundler', '~> 1.3'
  spec.add_development_dependency 'rake'
  spec.add_development_dependency 'rspec'

end
