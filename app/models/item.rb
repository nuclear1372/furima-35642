class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :prefecture
  belongs_to :status
  belongs_to :category
  belongs_to :days_to_ship
  
  with_options numericality: {other_than: 0, message: "can't be blank"} do
    validates :prefecture_id
    validates :status_id
    validates :category_id
    validates :days_to_ship_id
  end
end
