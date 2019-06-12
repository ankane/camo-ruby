require "bundler/setup"
Bundler.require(:default)
require "minitest/autorun"
require "minitest/pride"

ENV["CAMO_HOST"] ||= "http://camo.example.com"
ENV["CAMO_KEY"]  ||= "461fbf74af826c3a1020"

class TestContainer
  extend Camo
end
