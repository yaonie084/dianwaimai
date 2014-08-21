class ProductItem < ActiveRecord::Base
  belongs_to :shop
  has_many :user_item_ables
  has_many :users, through: :user_item_ables
end
