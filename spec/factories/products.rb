FactoryGirl.define do
  factory :product do
    title { Faker::Lorem.sentence }
    description { Faker::Lorem.paragraph }
    image_url "ruby.jpg"
    price { rand(5.0..50.00).round(2) }
  end
end
