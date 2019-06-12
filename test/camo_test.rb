require_relative "test_helper"

class CamoTest < Minitest::Test
  def test_view_helper
    expected = "http://camo.example.com/b82e650cfe20239b66f7165e54c3b9036d722aef/68747470733a2f2f7777772e6578616d706c652e636f6d2f706174682f746f2f696d6167652e706e67"
    assert_equal expected, TestContainer.camo("https://www.example.com/path/to/image.png")
  end
end
