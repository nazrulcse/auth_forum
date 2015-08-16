class AddOrderIdFieldToAuthForumLineItems < ActiveRecord::Migration
  def change
    add_column :auth_forum_line_items, :order_id, :integer
  end
end
