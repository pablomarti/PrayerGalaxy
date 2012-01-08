require 'test_helper'

class CommunityPostsControllerTest < ActionController::TestCase
  setup do
    @community_post = community_posts(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:community_posts)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create community_post" do
    assert_difference('CommunityPost.count') do
      post :create, community_post: @community_post.attributes
    end

    assert_redirected_to community_post_path(assigns(:community_post))
  end

  test "should show community_post" do
    get :show, id: @community_post.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @community_post.to_param
    assert_response :success
  end

  test "should update community_post" do
    put :update, id: @community_post.to_param, community_post: @community_post.attributes
    assert_redirected_to community_post_path(assigns(:community_post))
  end

  test "should destroy community_post" do
    assert_difference('CommunityPost.count', -1) do
      delete :destroy, id: @community_post.to_param
    end

    assert_redirected_to community_posts_path
  end
end
