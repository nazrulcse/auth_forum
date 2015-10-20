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
        format.js { render :layout => false }
      end
    end

    def about
      @about = About.last
    end

    def create_contact
      @contact = AuthForum::Contact.new(contact_params)
      respond_to do |format|
        if @contact.save
          format.html {
            redirect_to contact_path, :notice => 'Contact information has been sent'
          }
        else
          format.html {
            render 'contact'
          }
        end
      end
    end

    def contact
      @contact = AuthForum::Contact.new
    end

    protected

    def contact_params
      params[:contact].permit(:full_name, :email, :subject, :message)
    end

  end
end
