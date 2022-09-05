require "bundler/setup"
Bundler.require(:default)
require "minitest/autorun"
require "minitest/pride"
require "open-uri"

ENV["CAMO_HOST"] ||= "http://localhost:8080"
ENV["CAMO_KEY"]  ||= "461fbf74af826c3a1020"

class Minitest::Test
  include Camo
end
