require 'test_helper'

class VocabListsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get vocab_lists_index_url
    assert_response :success
  end

  test "should get show" do
    get vocab_lists_show_url
    assert_response :success
  end

  test "should get new" do
    get vocab_lists_new_url
    assert_response :success
  end

  test "should get create" do
    get vocab_lists_create_url
    assert_response :success
  end

  test "should get edit" do
    get vocab_lists_edit_url
    assert_response :success
  end

  test "should get update" do
    get vocab_lists_update_url
    assert_response :success
  end

  test "should get delete" do
    get vocab_lists_delete_url
    assert_response :success
  end

end
