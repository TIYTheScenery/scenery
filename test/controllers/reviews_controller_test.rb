require 'test_helper'

class ReviewsControllerTest < ActionController::TestCase
  test "create will accept json and create a review" do
    test_input = JSON.parse(File.read("#{Rails.root}/test/fixtures/review/mock_review_create.json")).merge(format: :json)
    post :create, test_input
    response = JSON.parse(@response.body)
    assert_equal Review.last.opinion, "It rocked!"
  end

  test "create will return errors if review creation fails" do
    test_input = JSON.parse(File.read("#{Rails.root}/test/fixtures/review/mock_review_create2.json")).merge(format: :json)
    post :create, test_input
    assert_response :success
    post :create, test_input
    response = JSON.parse(@response.body)
    assert_equal false, response["success"]
  end

  test "review may not be created unless the user is logged in" do
    test_input = JSON.parse(File.read("#{Rails.root}/test/fixtures/review/mock_review_create3.json")).merge(format: :json)
    post :create, test_input
    response = JSON.parse(@response.body)
    assert_equal false, response["success"]
  end

  test "can delete review" do
    num_reviews = Review.count
    delete :destroy, id: 1
    response = JSON.parse(@response.body)
    assert_equal num_reviews -1, Review.count
  end

  test "users can view a review" do
    test_input = JSON.parse(File.read("#{Rails.root}/test/fixtures/review/mock_review_create.json")).merge(format: :json)
    get :show, id: 2
    response = JSON.parse(@response.body)
    assert_equal "Merde!", Review.last.opinion
  end

end
