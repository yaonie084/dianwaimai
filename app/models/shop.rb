class Shop < ActiveRecord::Base
  has_many :product_items
  belongs_to :order
end
