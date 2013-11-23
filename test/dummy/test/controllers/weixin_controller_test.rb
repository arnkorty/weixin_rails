require 'test_helper'

class WeixinControllerTest < ActionController::TestCase
  test "should get text" do
    get :text
    assert_response :success
  end

  test "should get image" do
    get :image
    assert_response :success
  end

  test "should get index" do
    get :index
    assert_response :success
  end

end
