class CreateAuthForumContacts < ActiveRecord::Migration
  def change
    create_table :auth_forum_contacts do |t|
      t.string :full_name
      t.string :email
      t.string :subject
      t.text :message

      t.timestamps null: false
    end
  end
end
