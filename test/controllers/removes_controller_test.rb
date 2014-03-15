require 'test_helper'

class RemovesControllerTest < ActionController::TestCase
  setup do
    @remove = removes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:removes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create remove" do
    assert_difference('Remove.count') do
      post :create, remove: { death: @remove.death }
    end

    assert_redirected_to remove_path(assigns(:remove))
  end

  test "should show remove" do
    get :show, id: @remove
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @remove
    assert_response :success
  end

  test "should update remove" do
    patch :update, id: @remove, remove: { death: @remove.death }
    assert_redirected_to remove_path(assigns(:remove))
  end

  test "should destroy remove" do
    assert_difference('Remove.count', -1) do
      delete :destroy, id: @remove
    end

    assert_redirected_to removes_path
  end
end
