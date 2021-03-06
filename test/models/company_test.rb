require 'test_helper'

class CompanyTest < ActiveSupport::TestCase

  test "Can find the next upcoming performance" do
    company = Company.create!(name: "This", description: "Now")
    test_unit = Performance.create!(name: "This thing", description: "This thing happens")
    test_date = ShowTime.create!(zip_code: "27703", state: "NC", city: "Durham", address: "344 here st.", show_date: "Mon, 10 Apr 2018 10:57:49 -0400")
    test_unit2 = Performance.create!(name: "This thing", description: "This thing happens")
    test_date2 = ShowTime.create!(zip_code: "27703", state: "NC", city: "Durham", address: "344 here st.", show_date: "Mon, 10 Apr 2015 10:57:49 -0400")
    test_unit3 = Performance.create!(name: "This thing", description: "This thing happens")
    test_date3 = ShowTime.create!(zip_code: "27703", state: "NC", city: "Durham", address: "344 here st.", show_date: "Mon, 10 Apr 2019 10:57:49 -0400")
    test_unit.show_times << test_date
    test_unit2.show_times << test_date2
    test_unit3.show_times << test_date3
    company.performances << test_unit
    company.performances << test_unit2
    company.performances << test_unit3
    assert_equal test_unit, company.upcoming_performances.first
    refute_equal test_unit2, company.upcoming_performances
    assert_equal test_unit3, company.upcoming_performances.last
  end

  test "Can verify past performance" do
    company = Company.create!(name: "This", description: "Now")
    test_unit = Performance.create!(name: "This thing", description: "This thing happens")
    test_date = ShowTime.create!(zip_code: "27703", state: "NC", city: "Durham", address: "344 here st.", show_date: "Mon, 10 Apr 2016 10:57:49 -0400")
    test_unit.show_times << test_date
    company.performances << test_unit
    assert_equal test_unit, company.past_performances.first
  end
end
