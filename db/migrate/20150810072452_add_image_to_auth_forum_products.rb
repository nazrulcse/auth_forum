class AddImageToAuthForumProducts < ActiveRecord::Migration
  def change
    add_column :auth_forum_products, :image, :string
  end
end
