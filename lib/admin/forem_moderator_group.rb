ActiveAdmin.register Forem::ModeratorGroup do
  menu parent: 'Forem', label: 'Moderator Group'
  controller do
    def create
      moderator_group = Forem::ModeratorGroup.new(moderator_group_params)
      if moderator_group.save
        redirect_to admin_forem_moderator_group_path(moderator_group)
      else
        render 'new'
      end
    end

    def update
      moderator_group = Forem::ModeratorGroup.find_by_id(params[:id])
      if moderator_group.update_attributes(moderator_group_params)
        redirect_to admin_forem_moderator_group_path(moderator_group)
      else
        render 'edit'
      end
    end

    def moderator_group_params
      params.require(:moderator_group).permit!
    end
  end
end