require 'test_helper'

class VisionsControllerTest < ActionController::TestCase
  setup do
    @vision = visions(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:visions)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create vision" do
    assert_difference('Vision.count') do
      post :create, vision: @vision.attributes
    end

    assert_redirected_to vision_path(assigns(:vision))
  end

  test "should show vision" do
    get :show, id: @vision.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @vision.to_param
    assert_response :success
  end

  test "should update vision" do
    put :update, id: @vision.to_param, vision: @vision.attributes
    assert_redirected_to vision_path(assigns(:vision))
  end

  test "should destroy vision" do
    assert_difference('Vision.count', -1) do
      delete :destroy, id: @vision.to_param
    end

    assert_redirected_to visions_path
  end
end
