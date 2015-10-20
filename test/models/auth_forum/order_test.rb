require 'test_helper'

module AuthForum
  class OrderTest < ActiveSupport::TestCase
    def setup
      @product = FactoryGirl.create(:product, :price => 25)
      @cart = FactoryGirl.create(:cart)
      @order = FactoryGirl.create(:order, :card_num => '11111111111111', :card_cvv => '123', :exp_month => '12/2017', :start_year => '12/2017', :same_address => true)
      @order1 = FactoryGirl.create(:order, :card_num => '11111111111111', :card_cvv => '123', :exp_month => '12/2017', :start_year => '12/2017',:b_address => 'b_add',:b_country => 'b-cou',:b_city => 'b_city',:b_zip => 's_zip ',:same_address => false)
      @order2 = FactoryGirl.create(:order, :card_num => '11111111111111', :card_cvv => '123', :exp_month => '12/2017', :start_year => '12/2017', :same_address => true, :is_guest => true)
      @order3 = FactoryGirl.create(:order, :card_num => '11111111111111', :card_cvv => '123', :exp_month => '12/2017', :start_year => '12/2017', :same_address => true, :is_guest => false)
    end

    test "add_to_line_item current_cart" do
      current_item = @cart.add_product(@product.id)
      line_item = @order.add_to_line_item(@cart)
      assert_not_empty(line_item)
    end

    test "update_billing_address show true if same address" do
      assert_equal @order.update_billing_address, true
    end

    test "update_billing_address show falsee if not same address" do
      assert_equal @order1.update_billing_address, nil
    end

    test "user_is_guest show true if user is guest" do
    assert_equal(@order2.user_is_guest?, true)
    end

    test "user_is_guest show false if user is guest" do
      assert_equal(@order3.user_is_guest?, false)
    end

    test "same_billing_address show true if address is same" do
      assert_equal(@order.same_billing_address?, false)
    end

    test "same_billing_address show false if address is same" do
      assert_equal(@order1.same_billing_address?, true)
    end

    test "total_item shows total quantity" do
      quantity = 2
      current_item = @cart.add_product(@product.id, quantity)
      line_item = @order.add_to_line_item(@cart)
      assert_equal @order.total_item, quantity
    end

    test "order_total shows total quantity" do
      quantity = 2
      expected_price = @product.price * quantity
      current_item = @cart.add_product(@product.id, quantity)
      line_item = @order.add_to_line_item(@cart)
      assert_equal @order.order_total, expected_price
    end

    test "to_s return order id" do
       assert_equal(@order.to_s, @order.id)
    end

  end
end
