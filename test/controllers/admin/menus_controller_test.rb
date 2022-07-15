require "test_helper"

class Admin::MenusControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admin_menus_index_url
    assert_response :success
  end

  test "should get show" do
    get admin_menus_show_url
    assert_response :success
  end
end
