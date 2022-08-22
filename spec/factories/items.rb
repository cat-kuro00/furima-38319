FactoryBot.define do
  factory :item do
    name {"qqqqq"}
    info {"qqqqq"}
    category_id { 2 }
    condition_id { 2 }
    shipping_id { 2 }
    prefecture_id { 2 }
    ship_days_id { 2 }
    price {300}


    after(:build) do |image|
      image.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
