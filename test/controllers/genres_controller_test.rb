require 'test_helper'

class GenresControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    response = JSON.parse(@response.body)
    assert_equal 2, response["genres"].length
    assert_equal "Theater", response["genres"][0]["category"]
  end

end
