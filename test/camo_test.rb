require_relative "test_helper"

class CamoTest < Minitest::Test
  def test_png
    url = camo("https://ankane.org/images/archer-large.png")
    assert url.start_with?(ENV["CAMO_HOST"])
    assert_equal "\x89PNG".b, URI.open(url).read[0..3]
  end

  def test_html
    url = camo("https://ankane.org/")
    assert_error url, 400, "Unsupported content-type returned"
  end

  def test_bad_signature
    url = camo("https://ankane.org/images/archer-large.png")
    assert_error url[0..-2], 403, "Bad Signature"
  end

  private

  def assert_error(url, status, message)
    error = assert_raises(OpenURI::HTTPError) do
      URI.open(url)
    end
    response = error.io
    assert_equal status, response.status[0].to_i
    assert_equal "#{message}\n", response.string
  end
end
