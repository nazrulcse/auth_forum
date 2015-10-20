require 'test_helper'

module AuthForum
  class OrdersControllerTest < ActionController::TestCase
    setup do
      @routes = Engine.routes
      @user = FactoryGirl.create(:user)
      @product = FactoryGirl.create(:product, :price => 25)
      sign_in @user
      @cart = FactoryGirl.create(:cart)
      session[:cart_id] = @cart.id
      @line_item = FactoryGirl.create(:line_item, :cart_id => @cart.id, :product_id => @product.id)
      @order = FactoryGirl.create(:order, :card_num => '4111111111111111', :card_cvv => '123', :exp_month => '12', :user_id => @user.id, :start_year => '2017', :same_address => true)
    end

    test "should get index" do
      get :index
      assert_response :success
      assert_not_nil assigns(:orders)
    end

    test "should show Order" do
      get :show, id: @order
      assert_response :success
    end

    test "should get new" do
      get :new
      assert_response :success
    end

    test "should create Order" do

      assert_difference('Order.count') do
        post :create, order: {card_holder_name: @order.card_holder_name, email: @order.email, is_guest: false, user_id: @order.user_id, card_num: '4111111111111111',:card_cvv => '123',:exp_month => '12', :user_id => @user.id, :start_year => '2017', first_name: "first name 2", last_name: "last name 2", s_address: "s_address 2", s_country: "s_country 2", s_city: "s_city 2", s_state: nil, s_zip: 1254, b_name: nil, b_address: "s_address 2", b_country: "s_country 2", b_state: nil, b_city: "s_city 2", b_zip: 0,cart_id: @cart.id, status_id: nil, same_address: true}
      end
      # assert_redirected_to order_path(assigns(:order))
    end

    test "Show Order Details" do
      xhr :get, :details, id: @order, format: 'js'
      assert_response :success
      assert_not_nil assigns(:order)
    end
  end
end
