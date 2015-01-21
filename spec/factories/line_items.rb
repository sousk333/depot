FactoryGirl.define do
  factory :line_item do
    product
    cart nil
    order nil
  end
end
