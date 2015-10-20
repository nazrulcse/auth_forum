require 'test_helper'

module AuthForum
  class LineItemsControllerTest < ActionController::TestCase
    setup do
      @routes = Engine.routes
      @user = FactoryGirl.create(:user, :name => 'nazrul')
      sign_in @user
      @cart = FactoryGirl.create(:cart)
      @product = FactoryGirl.create(:product, :price => 25)
      @line_item = FactoryGirl.create(:line_item, :cart_id => @cart.id, :product_id => @product.id)
      session[:cart_id] = @cart.id
    end

    test "should get new" do
      get :new
      assert_response :success
    end

    test "should create line_item" do
      assert_difference('LineItem.count') do
        post :create, line_item: { cart_id: @line_item.cart_id, product_id: @line_item.product_id }
      end

      assert_redirected_to products_path
    end


    test "should update line_item" do
      xhr :patch, :update, id: @line_item, :quantity => 2 ,format: 'js'
      assert_response :success
    end

    test "should destroy line_item" do
      assert_difference('LineItem.count', -1) do
        delete :destroy, id: @line_item
      end

      assert_redirected_to carts_path
    end
  end
end
