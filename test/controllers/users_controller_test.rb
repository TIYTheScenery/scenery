require 'test_helper'

class UsersControllerTest < ActionController::TestCase

  test "should get login" do
    User.create!(email: "test@test.com", password: "monkey", display_name: "thetester")
    post :login, format: :json, user_info: {email: "test@test.com", password: "monkey"}
    response = JSON.parse(@response.body)
    assert response["user_info"]
    assert response["user_info"]["login_token"]
  end

  test "logout will remove users token from the database and send reply in json" do
    User.create!(email: "test@test.com", password: "monkey", display_name: "thetester")
    post :login, format: :json, user_info: {email: "test@test.com", password: "monkey"}
    response = JSON.parse(@response.body)
    login_token = response["user_info"]["login_token"]
    post :logout, format: :json, user_info: {login_token: login_token}
    response = JSON.parse(@response.body)
    assert_equal true, response["success"]
  end

  test "logout without an incorrect login token will return an error saying user is not logged in" do
    login_token = SecureRandom.urlsafe_base64(32)
    post :logout, format: :json, user_info: {login_token: login_token}
    response = JSON.parse(@response.body)
    assert_equal false, response["success"]
    assert response["error"].match(/not logged in/)
  end

  test "create will accept json and create a user" do
    test_input = JSON.parse(File.read("#{Rails.root}/test/fixtures/mock_user_create.json")).merge(format: :json)
    post :create, test_input
    assert_equal User.last.email, "test@test.com"
  end

  test "create will return errors if user creation failed" do
    test_input = JSON.parse(File.read("#{Rails.root}/test/fixtures/mock_user_create.json")).merge(format: :json)
    post :create, test_input
    assert_response :success
    post :create, test_input
    response = JSON.parse(@response.body)
    assert_equal false, response["success"]
  end

  test "Users create will accept json and create a title" do
     get :show, id: 1
     response = JSON.parse(@response.body)
     assert_equal "Macbeth", Performance.first.name
   end


  test "You can view a user's profile and all of its nested titles" do
     get :show, id: 1
     response = JSON.parse(@response.body)
     assert_equal "Macbeth", Performance.first.name
   end

end
