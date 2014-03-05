require 'test_helper'

class SheepSellingsControllerTest < ActionController::TestCase
  setup do
    @sheep_selling = sheep_sellings(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:sheep_sellings)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create sheep_selling" do
    assert_difference('SheepSelling.count') do
      post :create, sheep_selling: { activity_id: @sheep_selling.activity_id, comment: @sheep_selling.comment, place: @sheep_selling.place, price: @sheep_selling.price, sheep_id: @sheep_selling.sheep_id, weight: @sheep_selling.weight }
    end

    assert_redirected_to sheep_selling_path(assigns(:sheep_selling))
  end

  test "should show sheep_selling" do
    get :show, id: @sheep_selling
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @sheep_selling
    assert_response :success
  end

  test "should update sheep_selling" do
    patch :update, id: @sheep_selling, sheep_selling: { activity_id: @sheep_selling.activity_id, comment: @sheep_selling.comment, place: @sheep_selling.place, price: @sheep_selling.price, sheep_id: @sheep_selling.sheep_id, weight: @sheep_selling.weight }
    assert_redirected_to sheep_selling_path(assigns(:sheep_selling))
  end

  test "should destroy sheep_selling" do
    assert_difference('SheepSelling.count', -1) do
      delete :destroy, id: @sheep_selling
    end

    assert_redirected_to sheep_sellings_path
  end
end
