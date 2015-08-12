require_dependency "auth_forum/application_controller"

module AuthForum
  class CartsController < ApplicationController

    def index
      @cart = Cart.find_by_id(session[:cart_id])
    end

    def checkout

    end

  end
end
