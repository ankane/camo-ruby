require "camo/version"
require "openssl"

module Camo
  def camo(image_url)
    raise "No CAMO_KEY" unless ENV["CAMO_KEY"]
    hexdigest = OpenSSL::HMAC.hexdigest(OpenSSL::Digest.new("sha1"), ENV["CAMO_KEY"], image_url)
    encoded_image_url = image_url.unpack('H*').first
    "#{ENV["CAMO_HOST"]}/#{hexdigest}/#{encoded_image_url}"
  end
end

if defined?(Rails)
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
