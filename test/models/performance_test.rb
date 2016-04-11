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
end
