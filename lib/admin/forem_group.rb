ActiveAdmin.register Forem::Group do
  menu parent: 'Forem', label: 'Group'
  controller do
    def create
      group = Forem::Group.new(group_params)
      if group.save
        redirect_to admin_forem_group_path(group)
      else
        render 'new'
      end
    end

    def update
      group = Forem::Group.find_by_id(params[:id])
      if group.update_attributes(group_params)
        redirect_to admin_forem_group_path(group)
      else
        render 'edit'
      end
    end

    def group_params
      params.require(:group).permit!
    end
  end
end
