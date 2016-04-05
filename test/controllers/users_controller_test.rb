require 'test_helper'

class UsersControllerTest < ActionController::TestCase

  test "should get login" do
    User.create!(email: "test@test.com", password: "monkey", display_name: "thetester")
    post :login, format: :json, user_info: {email: "test@test.com", password: "monkey"}
    response = JSON.parse(@response.body)
    assert response["user_info"]
    assert response["user_info"]["login_token"]
  end

  test "should get logout" do
    post :logout
    assert_response :success
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
end
