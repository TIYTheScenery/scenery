require 'test_helper'

class SearchControllerTest < ActionController::TestCase
  test "find performances based on name and Genre" do
    temp = performances(:one)
    temp.genres << genres(:one)
    temp = performances(:two)
    temp.genres << genres(:two)
    temp.genres << genres(:one)
    get :index, format: :json, search_term: "Macbeth", genre_id: 1, type: "1"
    response = JSON.parse(@response.body)
    assert_equal 1, response["performances"].length
    assert_equal performances(:one).id, response["performances"][0]["id"]
  end

  test "find performances based on Genre" do
    temp = performances(:one)
    temp.genres << genres(:one)
    temp = performances(:two)
    temp.genres << genres(:two)
    temp.genres << genres(:one)
    get :index, format: :json, genre_id: 1, type: "1"
    response = JSON.parse(@response.body)
    assert_equal 2, response["performances"].length
    assert_equal performances(:two).id, response["performances"][1]["id"]
  end

  test "find professional by name" do
    get :index, format: :json, search_term: "Bill", type: "2"
    response = JSON.parse(@response.body)
    assert_equal 1, response["professionals"].length
    assert_equal users(:one).login_token, response["professionals"][0]["login_token"]
  end

  test "find professional by title" do
    get :index, format: :json, search_term: "King", type: "2"
    response = JSON.parse(@response.body)
    assert_equal 1, response["professionals"].length
    assert_equal users(:one).login_token, response["professionals"][0]["login_token"]
  end

  test "find professional by display name" do
    get :index, format: :json, search_term: "User", type: "2"
    response = JSON.parse(@response.body)
    assert_equal 2, response["professionals"].length
    assert_equal users(:three).display_name, response["professionals"][0]["display_name"]
  end
end
