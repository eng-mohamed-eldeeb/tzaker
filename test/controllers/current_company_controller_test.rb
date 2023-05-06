require "test_helper"

class CurrentCompanyControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get current_company_index_url
    assert_response :success
  end
end
