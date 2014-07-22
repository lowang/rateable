# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'rateable/version'

Gem::Specification.new do |spec|
  spec.name          = "rateable"
  spec.version       = Rateable::VERSION
  spec.authors       = ["Przemysław Wróblewski"]
  spec.email         = ["przemyslaw.wroblewski@nokaut.pl"]
  spec.summary       = %q{Simple mongoid rating "plugin"}
  spec.description   = %q{stores rates in separate collection instead of embedding them}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.5"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "minitest"
  spec.add_development_dependency "pry"
  spec.add_dependency "mongoid"
end
