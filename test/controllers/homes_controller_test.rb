require 'test_helper'

class HomesControllerTest < ActionController::TestCase
  test "should get latest" do
    get :latest
    assert_response :success
  end

  test "should get hot" do
    get :hot
    assert_response :success
  end

end
