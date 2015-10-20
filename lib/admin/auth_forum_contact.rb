ActiveAdmin.register AuthForum::Contact do
  menu label: 'Contact'
  controller do
    def create
      contact = AuthForum::Category.new(contact_params)
      if contact.save
        redirect_to admin_auth_forum_contact_path(contact)
      else
        render 'new'
      end
    end

    def update
      contact = AuthForum::Contact.find_by_id(params[:id])
      if contact.update_attributes(contact_params)
        redirect_to admin_auth_forum_contact_path(contact)
      else
        render 'edit'
      end
    end

    def contact_params
      params.require(:contact).permit!
    end
  end
end
