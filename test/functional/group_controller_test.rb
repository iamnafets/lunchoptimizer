require 'test_helper'

class GroupControllerTest < ActionController::TestCase
  test "should get view" do
    get :view
    assert_response :success
  end

  test "should get join" do
    get :join
    assert_response :success
  end

end
