class CreateUserItemAbles < ActiveRecord::Migration
  def change
    create_table :user_item_ables do |t|
      t.integer :count, default: 0
      t.references :user, index: true
      t.references :product_item, index: true

      t.timestamps
    end
  end
end
