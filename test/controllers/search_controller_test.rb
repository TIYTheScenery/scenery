require 'test_helper'

class SearchControllerTest < ActionController::TestCase
  test "find performances based on name" do
    temp = Performance.first
    temp.genres << genres(:one)
    temp = Performance.last
    temp.genres << genres(:two)
    temp.genres << genres(:one)
    get :index, format: :json, search_info: {search_term: "Macbeth", genre_id: 1, location: "Durham, NC"}
    response = JSON.parse(@response.body)
    assert_equal 1, response["performances"].length
    assert_equal performances(:one).id = response["performances"][0]["id"]
  end

end
