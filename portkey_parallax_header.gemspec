# coding: utf-8
require File.expand_path('../lib/portkey_parallax_header/version', __FILE__)

Gem::Specification.new do |spec|
  spec.name          = "portkey_parallax_header"
  spec.version       = PortkeyParallaxHeader::VERSION
  spec.authors       = ["Elom Gomez"]
  spec.email         = ["gomezelom@yahoo.com"]

  spec.summary       = %q{TODO: Write a short summary, because Rubygems requires one.}
  spec.description   = %q{TODO: Write a longer description or delete this line.}
  spec.homepage      = "TODO: Put your gem's website or public repo URL here."
  spec.license       = "MIT"

  files = []
  files << 'README.md'
  files << 'LICENSE.txt'
  files << 'CODE_OF_CONDUCT.md'
  files.concat(Dir.glob('lib/**/*.rb'))
  spec.files         = files
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency 'rake'
end
