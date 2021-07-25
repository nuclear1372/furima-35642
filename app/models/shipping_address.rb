class ShippingAddress < ApplicationRecord
  belongs_to :purchase
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :prefecture

  validates :prefecture_id, numericality: {other_than: 0, message: "can't be blank"}
end
