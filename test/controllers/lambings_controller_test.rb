require 'test_helper'

class LambingsControllerTest < ActionController::TestCase
  setup do
    @lambing = lambings(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:lambings)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create lambing" do
    assert_difference('Lambing.count') do
      post :create, lambing: { comment: @lambing.comment, date: @lambing.date, sheep_id: @lambing.sheep_id }
    end

    assert_redirected_to lambing_path(assigns(:lambing))
  end

  test "should show lambing" do
    get :show, id: @lambing
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @lambing
    assert_response :success
  end

  test "should update lambing" do
    patch :update, id: @lambing, lambing: { comment: @lambing.comment, date: @lambing.date, sheep_id: @lambing.sheep_id }
    assert_redirected_to lambing_path(assigns(:lambing))
  end

  test "should destroy lambing" do
    assert_difference('Lambing.count', -1) do
      delete :destroy, id: @lambing
    end

    assert_redirected_to lambings_path
  end
end
