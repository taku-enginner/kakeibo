require "test_helper"

class ReceiptCategoryControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get receipt_category_index_url
    assert_response :success
  end

  test "should get show" do
    get receipt_category_show_url
    assert_response :success
  end

  test "should get new" do
    get receipt_category_new_url
    assert_response :success
  end

  test "should get create" do
    get receipt_category_create_url
    assert_response :success
  end

  test "should get edit" do
    get receipt_category_edit_url
    assert_response :success
  end

  test "should get update" do
    get receipt_category_update_url
    assert_response :success
  end

  test "should get destroy" do
    get receipt_category_destroy_url
    assert_response :success
  end
end
