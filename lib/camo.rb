# stdlib
require "openssl"

# modules
require "camo/version"

module Camo
  def camo(image_url)
    raise "No CAMO_KEY" unless ENV["CAMO_KEY"]
    raise "No CAMO_HOST" unless ENV["CAMO_HOST"]
    hexdigest = OpenSSL::HMAC.hexdigest("sha1", ENV["CAMO_KEY"], image_url)
    encoded_image_url = image_url.unpack1("H*")
    "#{ENV["CAMO_HOST"]}/#{hexdigest}/#{encoded_image_url}"
  end
end

if defined?(ActiveSupport)
  ActiveSupport.on_load(:action_view) do
    include Camo
  end

  ActiveSupport.on_load(:action_controller) do
    include Camo
  end
end

if defined?(Sinatra)
  Sinatra::Base.helpers Camo
end
