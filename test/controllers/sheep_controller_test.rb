require 'test_helper'

class SheepControllerTest < ActionController::TestCase
  setup do
    @sheep = sheep(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:sheep)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create sheep" do
    assert_difference('Sheep.count') do
      post :create, sheep: { code: @sheep.code, father_id: @sheep.father_id, mother_id: @sheep.mother_id, weight_100_days: @sheep.weight_100_days }
    end

    assert_redirected_to sheep_path(assigns(:sheep))
  end

  test "should show sheep" do
    get :show, id: @sheep
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @sheep
    assert_response :success
  end

  test "should update sheep" do
    patch :update, id: @sheep, sheep: { code: @sheep.code, father_id: @sheep.father_id, mother_id: @sheep.mother_id, weight_100_days: @sheep.weight_100_days }
    assert_redirected_to sheep_path(assigns(:sheep))
  end

  test "should destroy sheep" do
    assert_difference('Sheep.count', -1) do
      delete :destroy, id: @sheep
    end

    assert_redirected_to sheep_index_path
  end
end
