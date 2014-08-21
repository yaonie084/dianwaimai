class AddShopRefToOrder < ActiveRecord::Migration
  def change
    add_reference :orders, :shop, index: true
  end

end
