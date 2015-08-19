module AuthForum
  module OrdersHelper
    def total_item(order)
      count = 0
      order.line_items.each do |line_item|
        count = count + line_item.quantity
      end
      return count
    end

    def order_total(order)
      order_price = 0
      order.line_items.each do |line_item|
        line_item_price = 0
        line_item_price += line_item.quantity * line_item.product.price
        order_price = order_price + line_item_price
      end
      return order_price
    end
  end
end
