class CreateShops < ActiveRecord::Migration
  def change
    create_table :shops do |t|
      t.string :source_url
      t.string :name
      t.string :address
      t.string :tel

      t.timestamps
    end
  end
end
