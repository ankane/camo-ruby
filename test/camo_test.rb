require_relative "test_helper"

class CamoTest < Minitest::Test
  def test_png
    url = camo("https://ankane.org/images/archer-large.png")
    expected = "http://localhost:8080/2856d0dad17ea7156fa00cdb68805b398bafdef7/68747470733a2f2f616e6b616e652e6f72672f696d616765732f6172636865722d6c617267652e706e67"
    assert_equal expected, url
    assert_equal "\x89PNG".b, URI.parse(url).read[0..3]
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
      URI.parse(url).open
    end
    response = error.io
    assert_equal status, response.status[0].to_i
    assert_equal "#{message}\n", response.string
  end
end
