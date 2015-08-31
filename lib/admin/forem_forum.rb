ActiveAdmin.register Forem::Forum do
  menu parent: 'Forem', label: 'Forum'
  controller do
    def create
      forum = Forem::Forum.new(forum_params)
      if forum.save
        redirect_to admin_forem_forum_path(forum)
      else
        render 'new'
      end
    end

    def update
      forum = Forem::Forum.friendly.find(params[:id])
      if forum.update_attributes(forum_params)
        redirect_to admin_forem_forum_path(forum)
      else
        render 'edit'
      end
    end

    def forum_params
      params.require(:forum).permit!
    end
  end
end
