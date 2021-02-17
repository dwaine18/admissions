require 'test_helper'

class AdcomControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get adcom_show_url
    assert_response :success
  end

  test "should get new" do
    get adcom_new_url
    assert_response :success
  end

  test "should get edit" do
    get adcom_edit_url
    assert_response :success
  end

end
