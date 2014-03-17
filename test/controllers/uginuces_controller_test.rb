require 'test_helper'

class UginucesControllerTest < ActionController::TestCase
  setup do
    @uginuce = uginuces(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:uginuces)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create uginuce" do
    assert_difference('Uginuce.count') do
      post :create, uginuce: { activity_id: @uginuce.activity_id, sheep_id: @uginuce.sheep_id }
    end

    assert_redirected_to uginuce_path(assigns(:uginuce))
  end

  test "should show uginuce" do
    get :show, id: @uginuce
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @uginuce
    assert_response :success
  end

  test "should update uginuce" do
    patch :update, id: @uginuce, uginuce: { activity_id: @uginuce.activity_id, sheep_id: @uginuce.sheep_id }
    assert_redirected_to uginuce_path(assigns(:uginuce))
  end

  test "should destroy uginuce" do
    assert_difference('Uginuce.count', -1) do
      delete :destroy, id: @uginuce
    end

    assert_redirected_to uginuces_path
  end
end
