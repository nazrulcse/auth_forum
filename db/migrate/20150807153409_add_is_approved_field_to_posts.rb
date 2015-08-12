class AddIsApprovedFieldToPosts < ActiveRecord::Migration
  def change
    add_column :auth_forum_posts, :is_approved, :boolean, :default => false
  end
end
