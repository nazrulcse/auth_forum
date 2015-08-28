module AuthForum
  class OrderMailer < ApplicationMailer
    def order_confirm(order)
      @order = order
      mail(to: 'nazrulku07@gmail.com', subject: 'Confirmed order')
    end
  end
end
