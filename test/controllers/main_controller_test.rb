require "test_helper"

class MainControllerTest < ActionDispatch::IntegrationTest
  test "should get home_page" do
    get main_home_page_url
    assert_response :success
  end
end
