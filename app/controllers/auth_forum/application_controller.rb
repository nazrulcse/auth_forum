module AuthForum
  class ApplicationController < ActionController::Base
    helper_method :forem_user
    def forem_user
    end

    private
    def current_cart
      Cart.find(session[:cart_id])
    rescue ActiveRecord::RecordNotFound
      cart = Cart.create
      session[:cart_id] = cart.id
      cart
    end

  end
end
