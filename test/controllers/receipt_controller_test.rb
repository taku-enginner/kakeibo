require "test_helper"

class ReceiptControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get receipt_index_url
    assert_response :success
  end

  test "should get show" do
    get receipt_show_url
    assert_response :success
  end

  test "should get new" do
    get receipt_new_url
    assert_response :success
  end

  test "should get create" do
    get receipt_create_url
    assert_response :success
  end

  test "should get edit" do
    get receipt_edit_url
    assert_response :success
  end

  test "should get update" do
    get receipt_update_url
    assert_response :success
  end

  test "should get destroy" do
    get receipt_destroy_url
    assert_response :success
  end
end
