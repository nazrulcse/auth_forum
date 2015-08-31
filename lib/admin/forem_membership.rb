ActiveAdmin.register Forem::Membership do
  menu parent: 'Forem', label: 'MemberShip'
  controller do
    def create
      member = Forem::Membership.new(member_params)
      if member.save
        redirect_to admin_forem_membership_path(member)
      else
        render 'new'
      end
    end

    def update
      member = Forem::Membership.find_by_id(params[:id])
      if member.update_attributes(member_params)
        redirect_to admin_forem_membership_path(member)
      else
        render 'edit'
      end
    end

    def member_params
      params.require(:membership).permit!
    end
  end
end
