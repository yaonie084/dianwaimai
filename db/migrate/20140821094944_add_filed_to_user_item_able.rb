class AddFiledToUserItemAble < ActiveRecord::Migration
  def change
    add_reference :user_item_ables, :order, index: true
  end
end
