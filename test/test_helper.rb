require 'bundler/setup'
require 'camo'
require 'minitest/autorun'

ENV['CAMO_HOST'] ||= 'http://camo.example.com'
ENV['CAMO_KEY']  ||= '461fbf74af826c3a1020'

class TestContainer
  extend Camo
end
