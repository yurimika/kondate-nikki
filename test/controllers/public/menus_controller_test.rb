require "test_helper"

class Public::MenusControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get public_menus_new_url
    assert_response :success
  end

  test "should get index" do
    get public_menus_index_url
    assert_response :success
  end

  test "should get edit" do
    get public_menus_edit_url
    assert_response :success
  end

  test "should get show" do
    get public_menus_show_url
    assert_response :success
  end
end
