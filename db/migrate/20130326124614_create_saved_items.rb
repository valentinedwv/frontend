class CreateSavedItems < ActiveRecord::Migration
  def change
    create_table :saved_items do |t|
      t.integer :item_id
      t.references :user
      t.references :saved_list

      t.timestamps
    end
  end
end
