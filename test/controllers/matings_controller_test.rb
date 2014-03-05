require 'test_helper'

class MatingsControllerTest < ActionController::TestCase
  setup do
    @mating = matings(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:matings)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create mating" do
    assert_difference('Mating.count') do
      post :create, mating: { activity_id: @mating.activity_id, comment: @mating.comment, male_id: @mating.male_id, price: @mating.price, sheep_id: @mating.sheep_id }
    end

    assert_redirected_to mating_path(assigns(:mating))
  end

  test "should show mating" do
    get :show, id: @mating
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @mating
    assert_response :success
  end

  test "should update mating" do
    patch :update, id: @mating, mating: { activity_id: @mating.activity_id, comment: @mating.comment, male_id: @mating.male_id, price: @mating.price, sheep_id: @mating.sheep_id }
    assert_redirected_to mating_path(assigns(:mating))
  end

  test "should destroy mating" do
    assert_difference('Mating.count', -1) do
      delete :destroy, id: @mating
    end

    assert_redirected_to matings_path
  end
end
