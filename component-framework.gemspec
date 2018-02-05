
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "component/framework/version"

Gem::Specification.new do |spec|
  spec.name          = "component-framework"
  spec.version       = Component::Framework::VERSION
  spec.authors       = ["Alexander Yegorov"]
  spec.email         = ["ayroff@gmail.com"]

  spec.summary       = %q{The minimalistic framework for developing component based applications.}
  spec.homepage      = "https://github.com/brokermint/component-framework"
  spec.license       = "MIT"

  spec.files         = Dir["README.md", "lib/**/*.rb", "LICENSE.txt"]

  spec.add_development_dependency "bundler", "~> 1.16"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "railties", "~> 4.0"

end
