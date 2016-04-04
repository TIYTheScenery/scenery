require 'test_helper'

class ShowTimesControllerTest < ActionController::TestCase
  test "should get create" do
    post :create
    assert_response :success
  end

  test "create will accept json and create a showtime" do
    post :create, format: :json, show_time_info: {event_id: 1, event_type: "performance", begin_time: Time.now, end_time: Time.now, venue_id: 1, address: "114 South St.", city: "Durham", state: "NC", zip_code: "27703", date: Date.new}
    assert_equal ShowTime.last.city, "Durham"
  end

end
