# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'rancheros-guest/version'

Gem::Specification.new do |spec|
  spec.name          = "rancheros-guest"
  spec.version       = VagrantPlugins::GuestRancherOS::VERSION
  spec.authors       = ["Max Claus Nunes"]
  spec.email         = ["maxcnunes@gmail.com"]
  spec.description   = "A Vagrant plugin for Rancher OS guest"
  spec.summary       = spec.description
  spec.homepage      = "http://github.com/maxcnunes/rancheros-guest/"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]
end