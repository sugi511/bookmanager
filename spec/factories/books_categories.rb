FactoryGirl.define do
  factory :books_categories do
    book_id 1
    sequence(:category_id) { |n| n }
  end
end
