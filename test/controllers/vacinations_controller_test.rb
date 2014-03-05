require 'test_helper'

class VacinationsControllerTest < ActionController::TestCase
  setup do
    @vacination = vacinations(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:vacinations)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create vacination" do
    assert_difference('Vacination.count') do
      post :create, vacination: { activity_id: @vacination.activity_id, comment: @vacination.comment, reason: @vacination.reason, sheep_id: @vacination.sheep_id, vaccin_name: @vacination.vaccin_name }
    end

    assert_redirected_to vacination_path(assigns(:vacination))
  end

  test "should show vacination" do
    get :show, id: @vacination
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @vacination
    assert_response :success
  end

  test "should update vacination" do
    patch :update, id: @vacination, vacination: { activity_id: @vacination.activity_id, comment: @vacination.comment, reason: @vacination.reason, sheep_id: @vacination.sheep_id, vaccin_name: @vacination.vaccin_name }
    assert_redirected_to vacination_path(assigns(:vacination))
  end

  test "should destroy vacination" do
    assert_difference('Vacination.count', -1) do
      delete :destroy, id: @vacination
    end

    assert_redirected_to vacinations_path
  end
end
