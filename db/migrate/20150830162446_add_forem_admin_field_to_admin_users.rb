class AddForemAdminFieldToAdminUsers < ActiveRecord::Migration
  def change
    add_column :auth_forum_admin_users, :forem_admin, :boolean, :default => true
  end
end
