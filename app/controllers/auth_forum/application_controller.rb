module AuthForum
  class ApplicationController < ActionController::Base
    helper_method :forem_user
    helper_method :current_cart
    helper_method :authenticate_current_user!
    def forem_user
    end

    def current_cart
      Cart.find(session[:cart_id])
    rescue ActiveRecord::RecordNotFound
      cart = Cart.create
      session[:cart_id] = cart.id
      cart
    end

    def authenticate_current_user!
      current_user.present?
    end

    private
  end
end
