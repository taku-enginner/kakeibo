require "test_helper"

class DailyResultsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get daily_results_index_url
    assert_response :success
  end

  test "should get show" do
    get daily_results_show_url
    assert_response :success
  end
end
