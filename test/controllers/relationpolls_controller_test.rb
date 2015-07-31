require 'test_helper'

class RelationpollsControllerTest < ActionController::TestCase
  setup do
    @relationpoll = relationpolls(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:relationpolls)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create relationpoll" do
    assert_difference('Relationpoll.count') do
      post :create, relationpoll: { donator: @relationpoll.donator, user: @relationpoll.user }
    end

    assert_redirected_to relationpoll_path(assigns(:relationpoll))
  end

  test "should show relationpoll" do
    get :show, id: @relationpoll
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @relationpoll
    assert_response :success
  end

  test "should update relationpoll" do
    patch :update, id: @relationpoll, relationpoll: { donator: @relationpoll.donator, user: @relationpoll.user }
    assert_redirected_to relationpoll_path(assigns(:relationpoll))
  end

  test "should destroy relationpoll" do
    assert_difference('Relationpoll.count', -1) do
      delete :destroy, id: @relationpoll
    end

    assert_redirected_to relationpolls_path
  end
end
