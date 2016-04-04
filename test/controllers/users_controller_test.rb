require 'test_helper'

class UsersControllerTest < ActionController::TestCase

  test "should get login" do
    post :login
    assert_response :success
  end

  test "should get logout" do
    post :logout
    assert_response :success
  end

  test "create will accept json and create a user" do
    post :create, format: :json, user_info: {email: "test@test.com", password: "monkey", first_name: "John", last_name: "Doe", description: "I am a professional", professional: true, display_name: "TheDoe"}
    assert_equal User.last.email, "test@test.com"
  end
end
