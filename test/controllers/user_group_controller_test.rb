require "test_helper"

class UserGroupControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get user_group_index_url
    assert_response :success
  end

  test "should get show" do
    get user_group_show_url
    assert_response :success
  end

  test "should get new" do
    get user_group_new_url
    assert_response :success
  end

  test "should get create" do
    get user_group_create_url
    assert_response :success
  end

  test "should get edit" do
    get user_group_edit_url
    assert_response :success
  end

  test "should get update" do
    get user_group_update_url
    assert_response :success
  end

  test "should get destroy" do
    get user_group_destroy_url
    assert_response :success
  end
end
