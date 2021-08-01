class ShippingAddress < ApplicationRecord
  belongs_to :purchase

  validates :prefecture_id, presence: true, numericality: { other_than: 0, message: "can't be blank" }

  with_options presence: true do
    validates :postal_code
    validates :city
    validates :house_number
    validates :phone_number
  end
end
