ActiveAdmin.register AuthForum::Event do
  menu label: 'Event'
  controller do
    def create
      event = AuthForum::Event.new(event_params)
      if event.save
        redirect_to admin_auth_forum_event_path(event)
      else
        render 'new'
      end
    end

    def update
      event = AuthForum::Event.find_by_id(params[:id])
      if event.update_attributes(event_params)
        redirect_to admin_auth_forum_event_path(event)
      else
        render 'edit'
      end
    end

    def event_params
      params.require(:event).permit!
    end
  end
end
