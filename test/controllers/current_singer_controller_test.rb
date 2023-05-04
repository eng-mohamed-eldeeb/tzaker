require "test_helper"

class CurrentSingerControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get current_singer_index_url
    assert_response :success
  end
end
