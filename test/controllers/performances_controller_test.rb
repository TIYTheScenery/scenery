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
    assert_equal 3, ShowTime.count
  end
end
