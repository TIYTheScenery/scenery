require 'test_helper'

class CompaniesControllerTest < ActionController::TestCase
  test "create will accept json and create a performance" do
    test_input = JSON.parse(File.read("#{Rails.root}/test/fixtures/mock_company_create.json")).merge(format: :json)
    post :create, test_input
    assert_equal Company.last.name, "Little Green Pig"
  end

  test "should get show" do
    get :show
    assert_response :success
  end

  test "should get update" do
    get :update
    assert_response :success
  end

  test "should get destroy" do
    get :destroy
    assert_response :success
  end

end
