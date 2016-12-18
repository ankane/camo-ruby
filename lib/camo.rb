require "camo/version"
require "openssl"

module Camo

  def camo(image_url)
    return image_url if image_url.start_with?('data:image')
    hexdigest = OpenSSL::HMAC.hexdigest(OpenSSL::Digest.new("sha1"), ENV["CAMO_KEY"], image_url)
    encoded_image_url = image_url.unpack('H*').first
    "#{ENV["CAMO_HOST"]}/#{hexdigest}/#{encoded_image_url}"
  end

end

if defined?(Rails)
  ActionView::Base.send :include, Camo
  ActionController::Base.send :include, Camo
end

if defined?(Sinatra)
  Sinatra::Base.helpers Camo
end
