class MakeForemViewsPolymorphic < ActiveRecord::Migration
  def up
    add_column :forem_views, :viewable_id, :integer
    remove_column :forem_views, :topic_id, :integer
    #rename_column :forem_views, :topic_id, :viewable_id
    add_column :forem_views, :viewable_type, :string
    Forem::View.update_all("viewable_type='Forem::Topic'")
  end

  def down
    add_column :forem_views, :topic_id, :integer
    remove_column :forem_views, :viewable_type
    remove_column :forem_views, :viewable_id
  end
end