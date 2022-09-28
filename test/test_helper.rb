require "bundler/setup"
Bundler.require(:default)
require "minitest/autorun"
require "minitest/pride"
require "open-uri"

Camo.host = "http://localhost:8080"
Camo.key = "461fbf74af826c3a1020"

class Minitest::Test
  include Camo::Helper
end
