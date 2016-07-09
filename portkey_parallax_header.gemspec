# coding: utf-8
require File.expand_path('../lib/portkey_parallax_header/version', __FILE__)

Gem::Specification.new do |spec|
  spec.name          = "portkey_parallax_header"
  spec.version       = PortkeyParallaxHeader::VERSION
  spec.authors       = ["Elom Gomez"]
  spec.email         = ["gomezelom@yahoo.com"]

  spec.summary       = %q{Category to add a parallax effect to UIScrollView/UITableView/UICollectionView.}
  spec.description   = %q{Category to add a parallax effect to UIScrollView/UITableView/UICollectionView.}
  spec.homepage      = "https://www.github.com/sight-labs/portkey_parallax_header"
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
