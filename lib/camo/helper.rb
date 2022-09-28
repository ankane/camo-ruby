module Camo
  module Helper
    def camo(image_url)
      key = ENV["CAMO_KEY"]
      host = ENV["CAMO_HOST"]

      raise "No CAMO_KEY" unless key
      raise "No CAMO_HOST" unless host

      hexdigest = OpenSSL::HMAC.hexdigest("sha1", key, image_url)
      encoded_image_url = image_url.unpack1("H*")
      "#{host}/#{hexdigest}/#{encoded_image_url}"
    end
  end
end
