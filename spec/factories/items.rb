FactoryBot.define do
  factory :item do
    name               { Faker::Lorem.sentence }
    description        { Faker::Lorem.sentences }
    price              { Faker::Number.between(from: 1, to: 9_999_999) }
    category_id        { Faker::Number.between(from: 1, to: 10) }
    status_id          { Faker::Number.between(from: 1, to: 6) }
    delivery_charge_id { Faker::Number.between(from: 1, to: 2) }
    prefecture_id      { Faker::Number.between(from: 1, to: 47) }
    days_to_ship_id    { Faker::Number.between(from: 1, to: 3) }
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
