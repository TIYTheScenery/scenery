require 'test_helper'

class ShowTimeTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  test "Can create a show time" do
    st = ShowTime.new(event_id: 1, event_type: "performance", begin_time: Time.now, end_time: Time.now, venue_id: 1, address: "114 South St.", city: "Durham", state: "NC", zip_code: "27703", date: Date.new)
    assert st.save
  end
end
