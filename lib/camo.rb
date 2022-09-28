# stdlib
require "openssl"

# modules
require "camo/helper"
require "camo/version"

module Camo
  # TODO remove in 0.3.0
  include Helper
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
