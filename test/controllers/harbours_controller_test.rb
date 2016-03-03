require 'test_helper'

class HarboursControllerTest < ActionController::TestCase
  setup do
    @harbour = harbours(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:harbours)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create harbour" do
    assert_difference('Harbour.count') do
      post :create, harbour: { active: @harbour.active, address: @harbour.address, city: @harbour.city, country: @harbour.country, description: @harbour.description, name: @harbour.name, phone: @harbour.phone, zip: @harbour.zip }
    end

    assert_redirected_to harbour_path(assigns(:harbour))
  end

  test "should show harbour" do
    get :show, id: @harbour
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @harbour
    assert_response :success
  end

  test "should update harbour" do
    patch :update, id: @harbour, harbour: { active: @harbour.active, address: @harbour.address, city: @harbour.city, country: @harbour.country, description: @harbour.description, name: @harbour.name, phone: @harbour.phone, zip: @harbour.zip }
    assert_redirected_to harbour_path(assigns(:harbour))
  end

  test "should destroy harbour" do
    assert_difference('Harbour.count', -1) do
      delete :destroy, id: @harbour
    end

    assert_redirected_to harbours_path
  end
end
