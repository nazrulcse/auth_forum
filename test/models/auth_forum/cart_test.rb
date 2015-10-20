require 'test_helper'

module AuthForum
  class CartTest < ActiveSupport::TestCase
    def setup
      @product = FactoryGirl.create(:product, :price => 25)
      @product1 = FactoryGirl.create(:product, :price => 20)
      @cart = FactoryGirl.create(:cart)
    end

    test 'add cart to product' do
      current_item = @cart.add_product(@product.id)
      assert_equal current_item.quantity, 1
    end

    test 'add quantity of a product to cart' do
      @cart.add_product(@product.id).save
      @cart.add_product(@product.id, 2).save
      assert_equal @cart.total_cart_item, 3
    end

    test 'get total cart item of a cart' do
      @cart.add_product(@product.id).save
      @cart.add_product(@product.id, 2).save
      assert_equal @cart.total_cart_item, 3
    end

    test 'get total price of a cart' do
      @cart.add_product(@product.id, 2)
      @cart.add_product(@product1.id)
      exp_price = @product.price * 2 + @product1.price
      assert_equal @cart.total_price, exp_price
    end

    test 'get cart id' do
      @cart.add_product(@product.id, 2).save
      assert_equal @cart.to_s, @cart.id
    end

  end
end
