require 'test_helper'

module AuthForum
  class LineItemTest < ActiveSupport::TestCase
    def setup
      @product = FactoryGirl.create(:product, :price => 25)
      @cart = FactoryGirl.create(:cart)
    end
    test 'get total price of a line item' do
      quantity = 2
      current_item = @cart.add_product(@product.id, quantity)
      exp_price = @product.price * quantity
      assert_equal current_item.total_price, exp_price
    end

    test "get product_title of line item" do
      current_item = @cart.add_product(@product.id)
      assert_equal current_item.to_s, @product.title
    end
  end
end
