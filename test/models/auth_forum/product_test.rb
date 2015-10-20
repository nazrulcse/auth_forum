require 'test_helper'

module AuthForum
  class ProductTest < ActiveSupport::TestCase
    def setup
      @product = FactoryGirl.create(:product, :price => 25)
    end

    test "get product image get_image" do
      assert_equal @product.get_image('small'), 'assets/default.png'
    end

  end
end
