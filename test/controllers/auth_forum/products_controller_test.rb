require 'test_helper'

module AuthForum
  class ProductsControllerTest < ActionController::TestCase
    setup do
      @routes = Engine.routes
      @user = FactoryGirl.create(:user, :name => 'nazrul')
      sign_in @user
      @product = FactoryGirl.create(:product, :price => 25)
    end

    test "should get index" do
      get :index
      assert_response :success
      assert_not_nil assigns(:products)
    end

    test "should get new" do
      get :new
      assert_response :success
    end

    test "should create product" do
      assert_difference('Product.count') do
        post :create, product: { description: @product.description, price: @product.price, title: @product.title }
      end

      assert_redirected_to product_path(assigns(:product))
    end

    test "should show product" do
      get :show, id: @product
      assert_response :success
    end

    test "should get edit" do
      get :edit, id: @product
      assert_response :success
    end

    test "should update product" do
      patch :update, id: @product, product: { description: @product.description, price: @product.price, title: @product.title }
      assert_redirected_to product_path(assigns(:product))
    end

    test "should destroy product" do
      assert_difference('Product.count', -1) do
        delete :destroy, id: @product
      end

      assert_redirected_to products_path
    end

    test "Should show more" do
      xhr :get, :more
      assert_response :success
      assert_not_nil assigns(:products)
    end

  end
end
