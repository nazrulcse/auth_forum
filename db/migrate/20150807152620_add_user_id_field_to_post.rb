class AddUserIdFieldToPost < ActiveRecord::Migration
  def change
    add_column :auth_forum_posts, :user_id, :integer
  end
end
