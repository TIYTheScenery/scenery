require 'test_helper'

class ShowTimeTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  test "Can create a show time" do
    st = ShowTime.new(event_id: 1, event_type: "performance", venue_id: 1, address: "114 South St.", city: "Durham", state: "NC", zip_code: "27703", show_date: DateTime.new)
    assert st.save
  end
end
