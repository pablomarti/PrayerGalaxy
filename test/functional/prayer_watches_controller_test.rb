require 'test_helper'

class PrayerWatchesControllerTest < ActionController::TestCase
  setup do
    @prayer_watch = prayer_watches(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:prayer_watches)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create prayer_watch" do
    assert_difference('PrayerWatch.count') do
      post :create, prayer_watch: @prayer_watch.attributes
    end

    assert_redirected_to prayer_watch_path(assigns(:prayer_watch))
  end

  test "should show prayer_watch" do
    get :show, id: @prayer_watch.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @prayer_watch.to_param
    assert_response :success
  end

  test "should update prayer_watch" do
    put :update, id: @prayer_watch.to_param, prayer_watch: @prayer_watch.attributes
    assert_redirected_to prayer_watch_path(assigns(:prayer_watch))
  end

  test "should destroy prayer_watch" do
    assert_difference('PrayerWatch.count', -1) do
      delete :destroy, id: @prayer_watch.to_param
    end

    assert_redirected_to prayer_watches_path
  end
end
