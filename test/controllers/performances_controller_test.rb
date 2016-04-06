require 'test_helper'

class PerformancesControllerTest < ActionController::TestCase

  test "create will accept json and create a performance" do
    test_input = JSON.parse(File.read("#{Rails.root}/test/fixtures/mock_performance_create.json")).merge(format: :json)
    post :create, test_input
    assert_equal Performance.last.name, "John Dies At The End"
  end

  test "create will return errors if performance creation failed" do
    test_input = JSON.parse(File.read("#{Rails.root}/test/fixtures/mock_performance_create2.json")).merge(format: :json)
    post :create, test_input
    response = JSON.parse(@response.body)
    assert_equal false, response["success"]
  end

  test "create performance allows for creation of nested showtimes" do
    num_shows = ShowTime.count
    test_input = JSON.parse(File.read("#{Rails.root}/test/fixtures/mock_nested_showtimes.json")).merge(format: :json)
    post :create, test_input
    response = JSON.parse(@response.body)
    assert_equal test_input["performance"]["show_times_attributes"][0]["city"], "Durham"
    assert_equal num_shows + 1, ShowTime.count
    assert_equal "Performance", ShowTime.last.event_type
  end

  test "performances may not be created unless the user is logged in" do
    test_input = JSON.parse(File.read("#{Rails.root}/test/fixtures/mock_performance_create3.json")).merge(format: :json)
    post :create, test_input
    response = JSON.parse(@response.body)
    assert_equal false, response["success"]

  end

  test "create performances will return errors if performance creation failed" do
    test_input = JSON.parse(File.read("#{Rails.root}/test/fixtures/mock_performance_create2.json")).merge(format: :json)
    post :create, test_input
    assert_response :success
    post :create, test_input
    response = JSON.parse(@response.body)
    assert_equal false, response["success"]
  end


  test "create will accept json and create a user" do
    test_input = JSON.parse(File.read("#{Rails.root}/test/fixtures/mock_performance_create.json")).merge(format: :json)
    post :create, test_input
    assert_equal Performance.last.name, "John Dies At The End"
  end

  test "can create multiple showtimes for one performance" do
    num_shows = ShowTime.count
    test_input = JSON.parse(File.read("#{Rails.root}/test/fixtures/mock_multiple_showtimes.json")).merge(format: :json)
    post :create, test_input
    response = JSON.parse(@response.body)
    assert_equal num_shows + 2, ShowTime.count
  end

<<<<<<< HEAD
  test "Users can view one performance and all of its nested showtimes" do
     get :show, id: 1
     response = JSON.parse(@response.body)
     assert_equal "Macbeth", Performance.first.name
   end
=======
  test "can delete Performance and the nested ShowTimes" do
    num_shows = Performance.count
    num_times = ShowTime.count
    delete :destroy, id: 1
    response = JSON.parse(@response.body)
    assert_equal num_shows -1, Performance.count
    assert_equal num_times -2, ShowTime.count
  end

>>>>>>> dfc2048d743cbe7ceff176b8474ea3edeb4ae0fc
end
