FactoryGirl.define do
  factory :user do
    name { Faker::Name.name }
    password { Faker::Lorem.characters(20) }
    password_confirmation { password }
  end
end
