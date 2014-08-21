class Order < ActiveRecord::Base
  belongs_to :originzer, class_name: 'User', foreign_key: "user_id"
  has_many :user_item_ables
  has_one  :shop

  private

end
