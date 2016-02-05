require 'test_helper'

class TransferRequestsControllerTest < ActionController::TestCase
  setup do
    @transfer_request = transfer_requests(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:transfer_requests)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create transfer_request" do
    assert_difference('TransferRequest.count') do
      post :create, transfer_request: { amount: @transfer_request.amount, description: @transfer_request.description, medium: @transfer_request.medium, payee_id: @transfer_request.payee_id, status: @transfer_request.status, transaction_date: @transfer_request.transaction_date }
    end

    assert_redirected_to transfer_request_path(assigns(:transfer_request))
  end

  test "should show transfer_request" do
    get :show, id: @transfer_request
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @transfer_request
    assert_response :success
  end

  test "should update transfer_request" do
    patch :update, id: @transfer_request, transfer_request: { amount: @transfer_request.amount, description: @transfer_request.description, medium: @transfer_request.medium, payee_id: @transfer_request.payee_id, status: @transfer_request.status, transaction_date: @transfer_request.transaction_date }
    assert_redirected_to transfer_request_path(assigns(:transfer_request))
  end

  test "should destroy transfer_request" do
    assert_difference('TransferRequest.count', -1) do
      delete :destroy, id: @transfer_request
    end

    assert_redirected_to transfer_requests_path
  end
end
