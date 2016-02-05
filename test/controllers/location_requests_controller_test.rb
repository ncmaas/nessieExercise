require 'test_helper'

class LocationRequestsControllerTest < ActionController::TestCase
  setup do
    @location_request = location_requests(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:location_requests)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create location_request" do
    assert_difference('LocationRequest.count') do
      post :create, location_request: { lat: @location_request.lat, long: @location_request.long, radius: @location_request.radius }
    end

    assert_redirected_to location_request_path(assigns(:location_request))
  end

  test "should show location_request" do
    get :show, id: @location_request
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @location_request
    assert_response :success
  end

  test "should update location_request" do
    patch :update, id: @location_request, location_request: { lat: @location_request.lat, long: @location_request.long, radius: @location_request.radius }
    assert_redirected_to location_request_path(assigns(:location_request))
  end

  test "should destroy location_request" do
    assert_difference('LocationRequest.count', -1) do
      delete :destroy, id: @location_request
    end

    assert_redirected_to location_requests_path
  end
end
