require 'test_helper'

class DevicesControllerTest < ActionController::TestCase
  setup do
    @device = devices(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:devices)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create device" do
    assert_difference('Device.count') do
      post :create, device: { active: @device.active, current_status: @device.current_status, device_number: @device.device_number, hardware_version: @device.hardware_version, install_date: @device.install_date, killed_date: @device.killed_date, last_seen: @device.last_seen, mac_address: @device.mac_address, slip_id: @device.slip_id, software_version: @device.software_version }
    end

    assert_redirected_to device_path(assigns(:device))
  end

  test "should show device" do
    get :show, id: @device
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @device
    assert_response :success
  end

  test "should update device" do
    patch :update, id: @device, device: { active: @device.active, current_status: @device.current_status, device_number: @device.device_number, hardware_version: @device.hardware_version, install_date: @device.install_date, killed_date: @device.killed_date, last_seen: @device.last_seen, mac_address: @device.mac_address, slip_id: @device.slip_id, software_version: @device.software_version }
    assert_redirected_to device_path(assigns(:device))
  end

  test "should destroy device" do
    assert_difference('Device.count', -1) do
      delete :destroy, id: @device
    end

    assert_redirected_to devices_path
  end
end
