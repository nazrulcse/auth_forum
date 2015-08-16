require_dependency "auth_forum/application_controller"

module AuthForum
  class WelcomeController < ApplicationController
    def index
      @posts = Post.all
      @products = Product.all
    end

    def user_authentication
      @status = 'Success'
      user = User.find_by_email(params[:user][:email])
      if user.present?
        if user.valid_password?(params[:user][:password])
          sign_in user, :bypass => true
        else
          @status = 'Invalid Password'
        end
      else
        @status = 'Invalid Email'
      end
      respond_to do |format|
        format.js {render :layout => false}
      end
    end

  end
end
