class CreateAuthForumCategories < ActiveRecord::Migration
  def change
    create_table :auth_forum_categories do |t|
      t.string :category_type
      t.timestamps null: false
    end
  end
end
