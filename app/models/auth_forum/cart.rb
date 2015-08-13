module AuthForum
  class Cart < ActiveRecord::Base
    has_many :line_items, :dependent => :destroy

    def add_product(product_id, quantity = 1)
      current_item = line_items.find_by_product_id(product_id)
      if current_item.present?
        current_item.quantity += quantity.to_i
      else
        current_item = line_items.build(:product_id => product_id, :quantity => quantity)
      end
      current_item
    end

    def total_cart_item
      quantity = 0
      line_items.each do |line_item|
        quantity += line_item.quantity
      end
      quantity
    end

    def total_price
      total = 0
      line_items.each do |line_item|
       total += line_item.quantity * line_item.product.price
      end
      total
    end

  end
end
