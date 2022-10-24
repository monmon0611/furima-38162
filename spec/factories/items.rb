FactoryBot.define do
  factory :item do
    title               {Faker::Lorem.sentence}
    explanation         { "使わないので出品します" }
    category_id         {"2"}
    situation_id        {"2"}
    load_id             {"2"}
    shipping_origin_id  {"2"}
    number_of_day_id    {"2"}
    price               {"1000"}
    association :user
    

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
