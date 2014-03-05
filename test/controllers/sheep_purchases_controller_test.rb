require 'test_helper'

class SheepPurchasesControllerTest < ActionController::TestCase
  setup do
    @sheep_purchase = sheep_purchases(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:sheep_purchases)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create sheep_purchase" do
    assert_difference('SheepPurchase.count') do
      post :create, sheep_purchase: { activity_id: @sheep_purchase.activity_id, comment: @sheep_purchase.comment, place: @sheep_purchase.place, price: @sheep_purchase.price, sheep_id: @sheep_purchase.sheep_id }
    end

    assert_redirected_to sheep_purchase_path(assigns(:sheep_purchase))
  end

  test "should show sheep_purchase" do
    get :show, id: @sheep_purchase
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @sheep_purchase
    assert_response :success
  end

  test "should update sheep_purchase" do
    patch :update, id: @sheep_purchase, sheep_purchase: { activity_id: @sheep_purchase.activity_id, comment: @sheep_purchase.comment, place: @sheep_purchase.place, price: @sheep_purchase.price, sheep_id: @sheep_purchase.sheep_id }
    assert_redirected_to sheep_purchase_path(assigns(:sheep_purchase))
  end

  test "should destroy sheep_purchase" do
    assert_difference('SheepPurchase.count', -1) do
      delete :destroy, id: @sheep_purchase
    end

    assert_redirected_to sheep_purchases_path
  end
end
