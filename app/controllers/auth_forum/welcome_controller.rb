require_dependency "auth_forum/application_controller"

module AuthForum
  class WelcomeController < ApplicationController
    def index
      @posts = Post.all
      @products = Product.all
    end
  end
end
