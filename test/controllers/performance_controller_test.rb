require 'test_helper'

class PerformanceControllerTest < ActionController::TestCase
  test "should create performance" do
    assert_difference('Performance.count') do
      post :create, performance: {name: 'Hamlet'}
    end

    assert_redirected_to performance_path(assigns(:performance))
  end

end
