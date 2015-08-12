class CreateAuthForumCarts < ActiveRecord::Migration
  def change
    create_table :auth_forum_carts do |t|

      t.timestamps null: false
    end
  end
end
