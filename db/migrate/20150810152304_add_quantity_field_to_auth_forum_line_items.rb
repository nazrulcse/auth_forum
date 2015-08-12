class AddQuantityFieldToAuthForumLineItems < ActiveRecord::Migration
  def change
    add_column :auth_forum_line_items, :quantity, :integer,:default => 1
  end
end
