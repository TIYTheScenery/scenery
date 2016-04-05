require 'test_helper'

class PerformancesControllerTest < ActionController::TestCase

  test "create will accept json and create a performance" do
    test_input = JSON.parse(File.read("#{Rails.root}/test/fixtures/mock_performance_create.json")).merge(format: :json)
    post :create, test_input
    assert_equal Performance.last.name, "Macbeth"
  end

  test "create will return errors if performance creation failed" do
    test_input = JSON.parse(File.read("#{Rails.root}/test/fixtures/mock_performance_create2.json")).merge(format: :json)
    post :create, test_input
    response = JSON.parse(@response.body)
    assert_equal false, response["success"]
  end

  test "create performance allows for creation of nested showtimes" do
    test_input = JSON.parse(File.read("#{Rails.root}/test/fixtures/mock_nested_showtimes.json")).merge(format: :json)
    post :create, test_input
    response = JSON.parse(@response.body)
    assert_equal test_input["performance"]["show_times_attributes"][0]["city"], "Durham"
    assert_equal 2, ShowTime.count
    assert_equal "performance", ShowTime.last.event_type
  end

  test "performances may not be created unless the user is logged in" do
    test_input = JSON.parse(File.read("#{Rails.root}/test/fixtures/mock_performance_create3.json")).merge(format: :json)
    post :create, test_input
    response = JSON.parse(@response.body)
    assert_equal false, response["success"]

  end

  test "create performances will return errors if user creation failed" do
    test_input = JSON.parse(File.read("#{Rails.root}/test/fixtures/mock_performance_create.json")).merge(format: :json)
    post :create, test_input
    assert_response :success
    post :create, test_input
    response = JSON.parse(@response.body)
    assert_equal false, response["success"]
  end

  test "create will accept json and create a user" do
    test_input = JSON.parse(File.read("#{Rails.root}/test/fixtures/mock_performance_create.json")).merge(format: :json)
    post :create, test_input
    assert_equal Performance.last.name, "Macbeth"
  end

end
