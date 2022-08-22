FactoryBot.define do
  factory :item do
    image {Faker::Lorem.sentence}
    name {Faker::Lorem.word}
    info {Faker::Lorem.sentence}
    category_id { Category.all.sample }
    condition_id { Category.all.sample }
    shipping_id { Category.all.sample }
    prefecture_id { Category.all.sample }
    ship_days_id { Category.all.sample }
    price {300}

    association :user 
  end
end
