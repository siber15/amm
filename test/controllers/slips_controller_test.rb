require 'test_helper'

class SlipsControllerTest < ActionController::TestCase
  setup do
    @slip = slips(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:slips)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create slip" do
    assert_difference('Slip.count') do
      post :create, slip: { pier_id: @slip.pier_id, slip_number: @slip.slip_number }
    end

    assert_redirected_to slip_path(assigns(:slip))
  end

  test "should show slip" do
    get :show, id: @slip
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @slip
    assert_response :success
  end

  test "should update slip" do
    patch :update, id: @slip, slip: { pier_id: @slip.pier_id, slip_number: @slip.slip_number }
    assert_redirected_to slip_path(assigns(:slip))
  end

  test "should destroy slip" do
    assert_difference('Slip.count', -1) do
      delete :destroy, id: @slip
    end

    assert_redirected_to slips_path
  end
end
