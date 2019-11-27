require 'test_helper'

class UserLanguagesControllerTest < ActionDispatch::IntegrationTest
  test "should get edit" do
    get user_languages_edit_url
    assert_response :success
  end

end
