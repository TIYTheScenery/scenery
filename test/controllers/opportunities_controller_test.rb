require 'test_helper'

class OpportunitiesControllerTest < ActionController::TestCase

  test "create will accept json and create a opportunity" do
    test_input = JSON.parse(File.read("#{Rails.root}/test/fixtures/opportunity/mock_opportunity_create.json")).merge(format: :json)
    post :create, test_input
    assert_equal Opportunity.last.contact_info, "awesomepawesome@ossumpossum.com"
  end

  test "create will return errors if opportunity creation failed" do
    test_input = JSON.parse(File.read("#{Rails.root}/test/fixtures/opportunity/mock_opportunity_create2.json")).merge(format: :json)
    post :create, test_input
    response = JSON.parse(@response.body)
    assert_equal false, response["success"]
  end

  test "opportunitys may not be created unless the user is logged in" do
    test_input = JSON.parse(File.read("#{Rails.root}/test/fixtures/opportunity/mock_opportunity_create3.json")).merge(format: :json)
    post :create, test_input
    response = JSON.parse(@response.body)
    assert_equal false, response["success"]
  end

  test "create opportunitys will return errors if opportunity creation failed" do
    test_input = JSON.parse(File.read("#{Rails.root}/test/fixtures/opportunity/mock_opportunity_create2.json")).merge(format: :json)
    post :create, test_input
    assert_response :success
    post :create, test_input
    response = JSON.parse(@response.body)
    assert_equal false, response["success"]
  end

  test "Users can view one opportunity" do
    test_input = JSON.parse(File.read("#{Rails.root}/test/fixtures/opportunity/mock_opportunity_create.json")).merge(format: :json)
    get :show, id: 1
    response = JSON.parse(@response.body)
    assert_equal "awesomepawesome@ossumpossum.com", Opportunity.first.contact_info
   end

  test "can delete opportunity" do
    num_opportunities = Opportunity.count
    delete :destroy, id: 1
    response = JSON.parse(@response.body)
    assert_equal num_opportunities -1, Opportunity.count
  end
end
