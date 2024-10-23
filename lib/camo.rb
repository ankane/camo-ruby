# stdlib
require "openssl"

# modules
require_relative "camo/helper"
require_relative "camo/version"

module Camo
  class << self
    attr_writer :host, :key

    def host
      @host ||= ENV["CAMO_HOST"]
    end

    def key
      @key ||= ENV["CAMO_KEY"]
    end
  end
end

if defined?(ActiveSupport)
  ActiveSupport.on_load(:action_view) do
    include Camo::Helper
  end

  ActiveSupport.on_load(:action_controller) do
    include Camo::Helper
  end
end

if defined?(Sinatra)
  Sinatra::Base.helpers Camo::Helper
end
