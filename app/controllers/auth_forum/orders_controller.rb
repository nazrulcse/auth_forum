require_dependency "auth_forum/application_controller"

module AuthForum
  class OrdersController < ApplicationController

    def new
      @order = Order.new
    end

    def create
      transaction = ActiveMerchant::Billing::StripeGateway.new(:login => 'sk_test_WMwFf4Euu4Hi6570qcEFy1na')
      @amount = current_cart.total_price.to_i
      paymentInfo = ActiveMerchant::Billing::CreditCard.new(
          :number             => order_params[:card_num],
          :month              => order_params[:exp_month],
          :year               => order_params[:start_year],
          :verification_value => order_params[:card_cvv])

      purchaseOptions = {:billing_address => {
          :name     => order_params[:first_name],
          :address1 => order_params[:b_address],
          :city     => order_params[:b_city],
          :zip      => order_params[:b_zip]
      }}

      @response = transaction.purchase((@amount * 100).to_i, paymentInfo, purchaseOptions)
      if @response.success?
        @order = Order.new(order_params)
        @order.user_id = current_user.id
        @order.card_number = @response.params["source"]["last4"]
        @order.status_id = "1"
        @order.email = current_user.email
        if @order.save
        current_cart.line_items.each do |item|
          line_item = LineItem.find_by_id(item.id)
          line_item.order_id = @order.id
          line_item.save
        end
          current_cart.delete
          session.delete(:cart_id)
      end
      else
        @result = @response.message
      end
    end
    private
    def order_params
      params.require(:order).permit(:card_holder_name, :card_num, :s_address, :s_country, :s_state,:s_city,:s_zip,:same_address, :first_name, :last_name, :b_address, :b_country, :b_state,:b_city,:b_zip,:status_id, :is_guest,:email,:user_id,:exp_month,:start_year,:card_cvv)
    end
  end
end
