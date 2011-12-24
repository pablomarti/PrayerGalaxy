require 'test_helper'

class MainControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get about" do
    get :about
    assert_response :success
  end

  test "should get partners" do
    get :partners
    assert_response :success
  end

  test "should get vision" do
    get :vision
    assert_response :success
  end

  test "should get contact" do
    get :contact
    assert_response :success
  end

  test "should get donate" do
    get :donate
    assert_response :success
  end

end
