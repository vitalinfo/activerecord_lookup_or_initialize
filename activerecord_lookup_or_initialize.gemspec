# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'activerecord_lookup_or_initialize/version'

Gem::Specification.new do |spec|
  spec.name          = "activerecord_lookup_or_initialize"
  spec.version       = ActiverecordLookupOrInitialize::VERSION
  spec.authors       = ["Vital Ryabchinskiy"]
  spec.email         = ["vital.ryabchinskiy@gmail.com"]

  spec.summary       = "Find or initialize object in collection"
  spec.description   = "ActiveRecord::Relation extension, find object in collection if it exists or build new one"
  spec.homepage      = "https://github.com/vitalinfo/activerecord_lookup_or_initialize"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.14"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency "sqlite3", "~> 1.3"

  spec.add_dependency 'activerecord', '>= 4.0.0'
  spec.add_dependency 'activesupport', '>= 4.0.0'
end
