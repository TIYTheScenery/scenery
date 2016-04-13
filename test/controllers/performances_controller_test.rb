require 'test_helper'

class PerformancesControllerTest < ActionController::TestCase

  test "create will accept json and create a performance" do
    test_input = JSON.parse(File.read("#{Rails.root}/test/fixtures/performance/mock_performance_create.json")).merge(format: :json)
    post :create, test_input
    assert_equal Performance.last.name, "John Dies At The End"
  end

  test "create will return errors if performance creation failed" do
    test_input = JSON.parse(File.read("#{Rails.root}/test/fixtures/performance/mock_performance_create2.json")).merge(format: :json)
    post :create, test_input
    response = JSON.parse(@response.body)
    assert_equal false, response["success"]
  end

  test "create performance allows for creation of nested showtimes" do
    num_shows = ShowTime.count
    test_input = JSON.parse(File.read("#{Rails.root}/test/fixtures/performance/mock_nested_showtimes.json")).merge(format: :json)
    post :create, test_input
    response = JSON.parse(@response.body)
    assert_equal test_input["performance"]["show_times_attributes"][0]["city"], "Durham"
    assert_equal num_shows + 1, ShowTime.count
    assert_equal "Performance", ShowTime.last.event_type
  end

  test "performances may not be created unless the user is logged in" do
    test_input = JSON.parse(File.read("#{Rails.root}/test/fixtures/performance/mock_performance_create3.json")).merge(format: :json)
    post :create, test_input
    response = JSON.parse(@response.body)
    assert_equal false, response["success"]

  end

  test "create performances will return errors if performance creation failed" do
    test_input = JSON.parse(File.read("#{Rails.root}/test/fixtures/performance/mock_performance_create2.json")).merge(format: :json)
    post :create, test_input
    assert_response :success
    post :create, test_input
    response = JSON.parse(@response.body)
    assert_equal false, response["success"]
  end


  test "create will accept json and create a user" do
    test_input = JSON.parse(File.read("#{Rails.root}/test/fixtures/performance/mock_performance_create.json")).merge(format: :json)
    post :create, test_input
    assert_equal Performance.last.name, "John Dies At The End"
  end

  test "can create multiple showtimes for one performance" do
    num_shows = ShowTime.count
    test_input = JSON.parse(File.read("#{Rails.root}/test/fixtures/performance/mock_multiple_showtimes.json")).merge(format: :json)
    post :create, test_input
    response = JSON.parse(@response.body)
    assert_equal num_shows + 2, ShowTime.count
  end

  test "Users can view one performance and all of its nested showtimes" do
    test_input = JSON.parse(File.read("#{Rails.root}/test/fixtures/performance/mock_multiple_showtimes.json")).merge(format: :json)
    get :show, id: 1
    response = JSON.parse(@response.body)
    assert_equal "Macbeth", Performance.first.name
   end

  test "can delete Performance and the nested ShowTimes" do
    num_shows = Performance.count
    num_times = ShowTime.count
    delete :destroy, id: 1
    response = JSON.parse(@response.body)
    assert_equal num_shows -1, Performance.count
    assert_equal num_times -2, ShowTime.count
  end

  test "performances can accept showtimes which can have cast members" do
    num_cast_members = CastMember.count
    test_input = JSON.parse(File.read("#{Rails.root}/test/fixtures/performance/mock_showtimes_with_cast_members.json")).merge(format: :json)
    post :create, test_input
    response = JSON.parse(@response.body)
    assert_equal num_cast_members + 16, CastMember.count
    assert_equal "John Doe", response["performance"]["show_times"][0]["cast_members"][0]["name"]
    assert_equal "Macbeth", response["performance"]["show_times"][0]["cast_members"][0]["role"]
    assert_equal "John Doe", response["performance"]["show_times"][1]["cast_members"][0]["name"]
    assert_equal "Macbeth", response["performance"]["show_times"][1]["cast_members"][0]["role"]
  end

  # test "You have to be a company to create a performance" do
  #   test_input = JSON.parse(File.read("#{Rails.root}/test/fixtures/performance/mock_performer_create_performance.json")).merge(format: :json)
  #   test_input2 = JSON.parse(File.read("#{Rails.root}/test/fixtures/performance/mock_user_create_performance.json")).merge(format: :json)
  #   post :create, test_input
  #   response = JSON.parse(@response.body)
  #   post :create, test_input2
  #   response = JSON.parse(@response.body)
  #   assert_equal "Macbeth", Performance.last.name
  #   refute_equal "Burber", Performance.last.name
  # end
end
