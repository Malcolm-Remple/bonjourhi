require 'test_helper'

class VocabItemsControllerControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get vocab_items_controller_index_url
    assert_response :success
  end

  test "should get show" do
    get vocab_items_controller_show_url
    assert_response :success
  end

  test "should get new" do
    get vocab_items_controller_new_url
    assert_response :success
  end

  test "should get create" do
    get vocab_items_controller_create_url
    assert_response :success
  end

  test "should get edit" do
    get vocab_items_controller_edit_url
    assert_response :success
  end

  test "should get update" do
    get vocab_items_controller_update_url
    assert_response :success
  end

  test "should get destroy" do
    get vocab_items_controller_destroy_url
    assert_response :success
  end

end
