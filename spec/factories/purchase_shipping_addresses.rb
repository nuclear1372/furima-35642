FactoryBot.define do
  factory :purchase_shipping_address do
    token {"tok_" + Faker::Lorem.characters(number: 20)}
    postal_code {"123-4567"}
    prefecture_id {1}
    city {"近江八幡市"}
    house_number {"1-1-1"}
    building_name {"レイクビュー近江"}
    phone_number {"09012345678"}
  end
end
