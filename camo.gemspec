require_relative "lib/camo/version"

Gem::Specification.new do |spec|
  spec.name          = "camo"
  spec.version       = Camo::VERSION
  spec.summary       = "Ruby client for Camo - the SSL image proxy"
  spec.homepage      = "https://github.com/ankane/camo-ruby"
  spec.license       = "MIT"

  spec.author        = "Andrew Kane"
  spec.email         = "andrew@ankane.org"

  spec.files         = Dir["*.{md,txt}", "{lib}/**/*"]
  spec.require_path  = "lib"

  spec.required_ruby_version = ">= 3.1"
end
