require 'test_helper'

class HomeControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get home_index_url
    assert_response :success
  end

  test "should get managehousingdetail" do
    get home_managehousingdetail_url
    assert_response :success
  end

  test "should get public" do
    get home_public_url
    assert_response :success
  end

end
