FactoryGirl.define do
  factory :order do
    name { Faker::Name.name }
    address { Faker::Address.city }
    email { Faker::Internet.email }
    pay_type { Order::PAYMENT_TYPES.sample }
  end
end
