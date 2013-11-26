require "camo/version"
require "openssl"

module Camo

  def camo(image_url)
    hexdigest = OpenSSL::HMAC.hexdigest(OpenSSL::Digest::Digest.new("sha1"), ENV["CAMO_KEY"], image_url)
    encoded_image_url = image_url.to_enum(:each_byte).map{|byte| "%02x" % byte }.join
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
