class AddRefToShop < ActiveRecord::Migration
  def change
    add_reference :shops, :order, index: true
  end
end
