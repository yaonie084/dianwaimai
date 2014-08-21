class UserItemAble < ActiveRecord::Base
  belongs_to :user
  belongs_to :product_item
  belongs_to :order
  # after_update :check_count

  # def check_count
  #   self.destory! if count <= 0
  # end
end
