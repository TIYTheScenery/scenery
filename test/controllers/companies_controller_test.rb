require 'test_helper'

class CompaniesControllerTest < ActionController::TestCase

  test "create will accept json and create a company" do
    test_input = JSON.parse(File.read("#{Rails.root}/test/fixtures/company/mock_company_create.json")).merge(format: :json)
    post :create, test_input
    assert_equal Company.last.name, "Burning Coal"
  end

  test "create will return errors if company creation failed" do
    test_input = JSON.parse(File.read("#{Rails.root}/test/fixtures/company/mock_company_create2.json")).merge(format: :json)
    post :create, test_input
    assert_response :success
    post :create, test_input
    response = JSON.parse(@response.body)
    assert_equal false, response["success"]
  end

  test "company may not be created unless the user is logged in" do
    test_input = JSON.parse(File.read("#{Rails.root}/test/fixtures/company/mock_company_create3.json")).merge(format: :json)
    post :create, test_input
    response = JSON.parse(@response.body)
    assert_equal false, response["success"]
  end

  test "can delete company" do
    num_companies = Company.count
    test_input = JSON.parse(File.read("#{Rails.root}/test/fixtures/mock_company_delete.json")).merge(format: :json)
    delete :destroy, id: 1, user_info: {login_token: "igotagoldenticket"}
    response = JSON.parse(@response.body)
    assert_equal num_companies -1, Company.count
  end

  test "you must be a professional to create a company" do
    test_input = JSON.parse(File.read("#{Rails.root}/test/fixtures/company/mock_company_create4.json")).merge(format: :json)
    test_input2 = JSON.parse(File.read("#{Rails.root}/test/fixtures/company/mock_company_create5.json")).merge(format: :json)
    post :create, test_input
    response = JSON.parse(@response.body)
    post :create, test_input2
    response = JSON.parse(@response.body)
    assert_equal "Ravenscroft", Company.last.name
    refute_equal "Cardinal Gibbons", Company.last.name
  end

  test "users can view a company" do
    get :show, id: 2
    response = JSON.parse(@response.body)
    assert_equal "Burning Coal", Company.last.name
  end

  # test "users can view a company's past performances" do
  #   test_input = JSON.parse(File.read("#{Rails.root}/test/fixtures/company/mock_company_create.json")).merge(format: :json)
  #   test_input2 = JSON.parse(File.read("#{Rails.root}/test/fixtures/performance/mock_view_performance_showtimes2.json")).merge(format: :json)
  #   num_shows = ShowTime.count
  #   post :create, test_input
  #   test_input.performances << test_input2
  #   get :show, id: 1
  #   response = JSON.parse(@response.body)
  #   assert_equal num_shows + 2, ShowTime.count
  # end


end
