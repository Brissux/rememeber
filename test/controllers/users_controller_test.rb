require "test_helper"

class UsersControllerTest < ActionDispatch::IntegrationTest
  test "should get liked_memes" do
    get users_liked_memes_url
    assert_response :success
  end
end
