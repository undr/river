# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'river/version'

Gem::Specification.new do |spec|
  spec.name          = "river"
  spec.version       = River::VERSION
  spec.authors       = ["undr"]
  spec.email         = ["undr@yandex.ru"]
  spec.description   = %q{River renders JSON to a stream using the batch iteration}
  spec.summary       = %q{River renders JSON to a stream using the batch iteration}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "timecop"
  spec.add_development_dependency "rspec"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "oj"

  spec.add_dependency "multi_json"
  spec.add_dependency "activesupport"
end
