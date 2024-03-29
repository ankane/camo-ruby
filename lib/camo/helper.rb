module Camo
  module Helper
    def camo(image_url, key: nil)
      key ||= Camo.key
      host = Camo.host

      raise "No CAMO_KEY" unless key
      raise "No CAMO_HOST" unless host

      # TODO support base64 encoding
      hexdigest = OpenSSL::HMAC.hexdigest("sha1", key, image_url)
      encoded_image_url = image_url.unpack1("H*")
      "#{host}/#{hexdigest}/#{encoded_image_url}"
    end
  end
end
