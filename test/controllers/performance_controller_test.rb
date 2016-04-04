require 'test_helper'

class PerformanceControllerTest < ActionController::TestCase
  test "should create performance" do
    assert_difference('Performance.count') do
      post :create, format: :json, performance: {owner_id: 1, company_id: 1, name: "Hamlet", description: "Hamlet is really upset about his new step-father", trailer_link: "hamlet.youtube.com", ticket_link: "hamlet.eventbrite.com"}
    end
  end

end
