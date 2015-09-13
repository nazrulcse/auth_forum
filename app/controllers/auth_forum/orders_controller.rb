require_dependency "auth_forum/application_controller"

module AuthForum
  class OrdersController < ApplicationController
    before_action :authenticate_user!, :only => ['index']

    def index
      @orders = Order.all.where(:user_id => current_user.id)
    end

    def new
      @order = Order.new
    end

    def create
      @order = Order.new(order_params)
      if current_user.present?
        @order.user_id = current_user.id
        @order.email = current_user.email
      end
      if @order.valid?
        transaction = ActiveMerchant::Billing::StripeGateway.new(:login => 'sk_test_WMwFf4Euu4Hi6570qcEFy1na')
        @amount = current_cart.total_price.to_i
        payment_info = ActiveMerchant::Billing::CreditCard.new(
            :number => order_params[:card_num],
            :month => order_params[:exp_month],
            :year => order_params[:start_year],
            :verification_value => order_params[:card_cvv])

        purchase_options = {
            :billing_address => {
                :name => order_params[:first_name],
                :address1 => order_params[:b_address],
                :city => order_params[:b_city],
                :zip => order_params[:b_zip]
            }
        }
        @response = transaction.purchase((@amount * 100).to_i, payment_info, purchase_options)
        if @response.success?
          @order.card_number = @response.params["source"]["last4"]
          @order.status_id = Order::ORDER_STATE[:delivery]
          if @order.save
            @order.add_to_line_item(current_cart)
            current_cart.delete
            session.delete(:cart_id)
            AuthForum::OrderMailer.order_confirm(@order).deliver_now
          end
        else
          @order.errors.add(:base, @response.message.to_s)
          render 'new'
        end
      else
        render 'new'
      end
    end

    def show
      @order = AuthForum::Order.find_by_id(params[:id])
    end

    def details
      @order = Order.find_by_id(params[:id])
      respond_to do |format|
        format.js {render :layout => false}
      end
    end

    private
    def order_params
      params.require(:order).permit(:card_holder_name, :card_num, :s_address, :s_country, :s_state, :s_city, :s_zip, :same_address, :first_name, :last_name, :b_address, :b_country, :b_state, :b_city, :b_zip, :status_id, :is_guest, :email, :user_id, :exp_month, :start_year, :card_cvv)
    end
  end
end
