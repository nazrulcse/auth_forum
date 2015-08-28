require_dependency "auth_forum/application_controller"

module AuthForum
  class CartsController < ApplicationController

    def index
      @cart = Cart.find_by_id(session[:cart_id])
    end

    def empty_cart
      current_cart.delete
      session.delete(:cart_id)
      redirect_to products_path
    end

  end
end
