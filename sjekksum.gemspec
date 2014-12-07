lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "sjekksum/version"

Gem::Specification.new do |spec|
  spec.name          = "sjekksum"
  spec.version       = Sjekksum::VERSION
  spec.authors       = ["Christoph Grabo"]
  spec.email         = ["chris@dinarrr.com"]
  spec.summary       = %q{Collection of some checksum validation algorithms}
  spec.description   = %q{A gem to provide some checksum algorithms like Damm, ISBN-10/13, Luhn, UPC and Verhoeff.}
  spec.homepage      = "https://github.com/asaaki/sjekksum"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.5"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "inch", "~> 0.5"
  spec.add_development_dependency "pry"
  spec.add_development_dependency "pry-doc"
  spec.add_development_dependency "rspec", "~> 3.1"
end
