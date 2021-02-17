require 'test_helper'

class AdcomsControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get adcoms_show_url
    assert_response :success
  end

  test "should get new" do
    get adcoms_new_url
    assert_response :success
  end

  test "should get edit" do
    get adcoms_edit_url
    assert_response :success
  end

end
