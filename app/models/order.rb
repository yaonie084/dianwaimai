class Order < ActiveRecord::Base
  extend Enumerize

  belongs_to :originzer, class_name: 'User', foreign_key: "user_id"
  has_many :user_item_ables
  has_one  :shop

  enumerize :is_success, in: [ 0, 1 ]

  scope :succeed, -> { where(is_success: 1) }

  private

    def self.find_by_id(id)
      where(id: id).first
    end
end
