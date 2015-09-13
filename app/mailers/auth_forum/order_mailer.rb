module AuthForum
  class OrderMailer < ApplicationMailer
    def order_confirm(order)
      @order = order
      mail(to: order.email, subject: 'Your order has been Confirmed')
    end
  end
end
