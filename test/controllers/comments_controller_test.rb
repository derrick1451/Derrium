require "test_helper"

class CommentsControllerTest < ActionDispatch::IntegrationTest
  test "should get :new" do
    get comments_:new_url
    assert_response :success
  end

  test "should get :create" do
    get comments_:create_url
    assert_response :success
  end
end
