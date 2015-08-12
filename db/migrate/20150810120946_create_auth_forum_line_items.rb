class CreateAuthForumLineItems < ActiveRecord::Migration
  def change
    create_table :auth_forum_line_items do |t|
      t.integer :cart_id
      t.integer :product_id

      t.timestamps null: false
    end
  end
end
