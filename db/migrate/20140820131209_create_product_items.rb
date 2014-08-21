class CreateProductItems < ActiveRecord::Migration
  def change
    create_table :product_items do |t|
      t.string :image_url
      t.string :name
      t.references :shop

      t.timestamps
    end

    add_index :product_items, :shop_id
  end
end
