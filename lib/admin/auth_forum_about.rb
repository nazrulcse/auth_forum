ActiveAdmin.register AuthForum::About do
  menu label: 'About'
  controller do
    def create
      about = AuthForum::About.new(about_params)
      if about.save
        redirect_to admin_auth_forum_about_path(about)
      else
        render 'new'
      end
    end

    def update
      about = AuthForum::About.find_by_id(params[:id])
      if about.update_attributes(about_params)
        redirect_to admin_auth_forum_about_path(about)
      else
        render 'edit'
      end
    end

    def about_params
      params.require(:about).permit!
    end
  end
end
