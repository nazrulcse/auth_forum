class CreateAuthForumEvents < ActiveRecord::Migration
  def change
    create_table :auth_forum_events do |t|
      t.string :name
      t.string :title
      t.text :description
      t.integer :product_id
      t.timestamps null: false
    end
  end
end
