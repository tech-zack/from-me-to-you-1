require "test_helper"

class AcountsControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get acounts_show_url
    assert_response :success
  end
end
