class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :prefecture
  belongs_to :status
  belongs_to :category
  
  with_options numericality: {other_than: 0, message: "can't be blank"} do
    validates :prefecture_id
    validates :status_id
    validates :category_id 
  end
end
