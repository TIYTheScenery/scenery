require 'test_helper'

class PerformanceTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  test "Can create performance" do
    P = Performance.create!(name: "Party", description: "It's a party")
    assert "Party", P.name
  end

  test "Name and description must be entered." do
    show = Performance.new()
    refute show.save
  end

  test "Can verify past performance" do
    test_unit = Performance.create!(name: "This thing", description: "This thing happens")
    test_date = ShowTime.create!(zip_code: "27703", state: "NC", city: "Durham", address: "344 here st.", date: "2016-04-04", begin_time: "2016-04-04T18:01:02.567Z")
    test_unit.show_times << test_date
    assert_equal true, test_unit.past_production?
  end
end
