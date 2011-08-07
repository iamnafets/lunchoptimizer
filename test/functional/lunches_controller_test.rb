require 'test_helper'

class LunchesControllerTest < ActionController::TestCase
  setup do
    @lunch = lunches(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:lunches)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create lunch" do
    assert_difference('Lunch.count') do
      post :create, :lunch => @lunch.attributes
    end

    assert_redirected_to lunch_path(assigns(:lunch))
  end

  test "should show lunch" do
    get :show, :id => @lunch.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @lunch.to_param
    assert_response :success
  end

  test "should update lunch" do
    put :update, :id => @lunch.to_param, :lunch => @lunch.attributes
    assert_redirected_to lunch_path(assigns(:lunch))
  end

  test "should destroy lunch" do
    assert_difference('Lunch.count', -1) do
      delete :destroy, :id => @lunch.to_param
    end

    assert_redirected_to lunches_path
  end
end
