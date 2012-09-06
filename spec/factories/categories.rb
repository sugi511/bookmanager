FactoryGirl.define do
  categories = %w|HTML CSS PHP Ruby|
  count = categories.size
  factory :category do
    sequence(:name) { |n| categories[(n-1) % count] }
  end
end
