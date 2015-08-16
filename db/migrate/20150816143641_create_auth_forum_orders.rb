class CreateAuthForumOrders < ActiveRecord::Migration
  def change
    create_table :auth_forum_orders do |t|
      t.string :card_holder_name
      t.string :email
      t.boolean :is_guest,default: false
      t.integer :user_id
      t.integer :card_number
      t.string :first_name
      t.string :last_name
      t.string :s_address
      t.string :s_country
      t.string :s_city
      t.string :s_state
      t.integer :s_zip
      t.string :b_name
      t.string :b_address
      t.string :b_country
      t.string :b_state
      t.string :b_city
      t.integer :b_zip
      t.integer :status_id
      t.boolean :same_address, default: false

      t.timestamps null: false
    end
  end
end
