ActiveAdmin.register User do
  permit_params :email, :password, :password_confirmation, :name, :forem_admin, :forem_state, :forem_auto_subscribe
  menu label: 'User'

  index do
    selectable_column
    id_column
    column :name
    column :email
    column :current_sign_in_at
    column :sign_in_count
    column :created_at
    actions
  end

  filter :email
  filter :name
  filter :current_sign_in_at
  filter :sign_in_count
  filter :created_at

  form do |f|
    f.inputs 'User Details' do
      f.input :name
      f.input :email
      f.input :password
      f.input :password_confirmation
      f.input :forem_admin
      f.input :forem_state
      f.input :forem_auto_subscribe
    end
    f.actions
  end

  controller do
    def update
      if params[:user][:password].blank?
        params[:user].delete("password")
        params[:user].delete("password_confirmation")
      end
      super
    end
  end

end
