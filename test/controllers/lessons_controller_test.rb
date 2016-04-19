require 'test_helper'

class LessonsControllerTest < ActionController::TestCase

  test "create will accept json and create a lesson" do
    test_input = JSON.parse(File.read("#{Rails.root}/test/fixtures/lesson/mock_lesson_create.json")).merge(format: :json)
    post :create, test_input
    assert_equal Lesson.last.name, "Being John Malkovich: Beginner Class on Vocal Techniques for Impressions"
  end

  test "create will return errors if lesson creation failed" do
    test_input = JSON.parse(File.read("#{Rails.root}/test/fixtures/lesson/mock_lesson_create2.json")).merge(format: :json)
    post :create, test_input
    response = JSON.parse(@response.body)
    assert_equal false, response["success"]
  end

  test "create lesson allows for creation of nested showtimes" do
    num_shows = ShowTime.count
    test_input = JSON.parse(File.read("#{Rails.root}/test/fixtures/lesson/mock_nested_showtimes.json")).merge(format: :json)
    post :create, test_input
    response = JSON.parse(@response.body)
    assert_equal test_input["lesson"]["show_times_attributes"][0]["city"], "Durham"
    assert_equal num_shows + 1, ShowTime.count
    assert_equal "Lesson", ShowTime.last.event_type
  end

  test "lessons may not be created unless the user is logged in" do
    test_input = JSON.parse(File.read("#{Rails.root}/test/fixtures/lesson/mock_lesson_create3.json")).merge(format: :json)
    post :create, test_input
    response = JSON.parse(@response.body)
    assert_equal false, response["success"]

  end

  test "create lessons will return errors if lesson creation failed" do
    test_input = JSON.parse(File.read("#{Rails.root}/test/fixtures/lesson/mock_lesson_create2.json")).merge(format: :json)
    post :create, test_input
    assert_response :success
    post :create, test_input
    response = JSON.parse(@response.body)
    assert_equal false, response["success"]
  end


  test "create will accept json and create a user" do
    test_input = JSON.parse(File.read("#{Rails.root}/test/fixtures/lesson/mock_lesson_create.json")).merge(format: :json)
    post :create, test_input
    assert_equal Lesson.last.name, "Being John Malkovich: Beginner Class on Vocal Techniques for Impressions"
  end

  test "Users can view one lesson and all of its nested showtimes" do
    test_input = JSON.parse(File.read("#{Rails.root}/test/fixtures/lesson/mock_multiple_showtimes.json")).merge(format: :json)
    get :show, id: 1
    response = JSON.parse(@response.body)
    assert_equal "Being John Malkovich: Beginner Class on Vocal Techniques for Impressions", Lesson.first.name
   end

end
