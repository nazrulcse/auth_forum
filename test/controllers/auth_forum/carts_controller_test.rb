require 'test_helper'

module AuthForum
  class CartsControllerTest < ActionController::TestCase
    setup do
      @routes = Engine.routes
      @user = FactoryGirl.create(:user, :name => 'nazrul')
      sign_in @user
      @cart = FactoryGirl.create(:cart)
      session[:cart_id] = @cart.id
    end

    test "should get index" do
      get :index
      assert_response :success
      assert_not_nil assigns(:cart)
    end

    test "should empty_cart" do
      get :empty_cart, id: @cart
      assert_redirected_to products_path()
    end

  end
end
