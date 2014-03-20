require 'test_helper'

class OtherPurchasesControllerTest < ActionController::TestCase
  setup do
    @other_purchase = other_purchases(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:other_purchases)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create other_purchase" do
    assert_difference('OtherPurchase.count') do
      post :create, other_purchase: { activity_id: @other_purchase.activity_id, what: @other_purchase.what, why: @other_purchase.why }
    end

    assert_redirected_to other_purchase_path(assigns(:other_purchase))
  end

  test "should show other_purchase" do
    get :show, id: @other_purchase
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @other_purchase
    assert_response :success
  end

  test "should update other_purchase" do
    patch :update, id: @other_purchase, other_purchase: { activity_id: @other_purchase.activity_id, what: @other_purchase.what, why: @other_purchase.why }
    assert_redirected_to other_purchase_path(assigns(:other_purchase))
  end

  test "should destroy other_purchase" do
    assert_difference('OtherPurchase.count', -1) do
      delete :destroy, id: @other_purchase
    end

    assert_redirected_to other_purchases_path
  end
end
