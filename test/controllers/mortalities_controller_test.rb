require 'test_helper'

class MortalitiesControllerTest < ActionController::TestCase
  setup do
    @mortality = mortalities(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:mortalities)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create mortality" do
    assert_difference('Mortality.count') do
      post :create, mortality: { date: @mortality.date, describe: @mortality.describe, sheep_id: @mortality.sheep_id }
    end

    assert_redirected_to mortality_path(assigns(:mortality))
  end

  test "should show mortality" do
    get :show, id: @mortality
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @mortality
    assert_response :success
  end

  test "should update mortality" do
    patch :update, id: @mortality, mortality: { date: @mortality.date, describe: @mortality.describe, sheep_id: @mortality.sheep_id }
    assert_redirected_to mortality_path(assigns(:mortality))
  end

  test "should destroy mortality" do
    assert_difference('Mortality.count', -1) do
      delete :destroy, id: @mortality
    end

    assert_redirected_to mortalities_path
  end
end
