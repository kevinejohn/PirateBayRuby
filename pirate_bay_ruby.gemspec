# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'pirate_bay_ruby/version'

Gem::Specification.new do |spec|
  spec.name          = "pirate_bay_ruby"
  spec.version       = PirateBayRuby::VERSION
  spec.authors       = ["Kevin Johnson"]
  spec.email         = ["kevinejohn@gmail.com"]
  spec.description   = "Search The Pirate Bay from the terminal"
  spec.summary       = %q{TODO: Write a gem summary}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.add_dependency "nokogiri"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
end
