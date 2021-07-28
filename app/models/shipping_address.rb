class ShippingAddress < ApplicationRecord
  belongs_to :purchase

  #validates :prefecture_id, numericality: { other_than: 0, message: "can't be blank" }
end
