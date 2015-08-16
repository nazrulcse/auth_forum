module AuthForum
  module ApplicationHelper

    def line_items_count
      cart_id = session[:cart_id]
      cart = AuthForum::Cart.find_by_id(cart_id)
      cart.line_items.count if cart.present?
    end

    def resource_name
      :user
    end

    def resource
      @resource ||= User.new
    end

    def devise_mapping
      @devise_mapping ||= Devise.mappings[:user]
    end

  end
end
