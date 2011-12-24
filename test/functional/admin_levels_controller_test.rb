require 'test_helper'

class AdminLevelsControllerTest < ActionController::TestCase
  setup do
    @admin_level = admin_levels(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:admin_levels)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create admin_level" do
    assert_difference('AdminLevel.count') do
      post :create, admin_level: @admin_level.attributes
    end

    assert_redirected_to admin_level_path(assigns(:admin_level))
  end

  test "should show admin_level" do
    get :show, id: @admin_level.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @admin_level.to_param
    assert_response :success
  end

  test "should update admin_level" do
    put :update, id: @admin_level.to_param, admin_level: @admin_level.attributes
    assert_redirected_to admin_level_path(assigns(:admin_level))
  end

  test "should destroy admin_level" do
    assert_difference('AdminLevel.count', -1) do
      delete :destroy, id: @admin_level.to_param
    end

    assert_redirected_to admin_levels_path
  end
end
