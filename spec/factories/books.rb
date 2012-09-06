FactoryGirl.define do
  factory :book do
    sequence(:title) {|n| "Programming Ruby#{n}" }
    author "daimon"
    sequence(:version){|n| n+1 }
    published_on 5.years.ago
    sequence(:image_url){|n| "http://wwww.amazon.com/image#{n}.jpg"}
    sequence(:amazon_url){|n| "http://wwww.amazon.com/#{n}"}
  end
end
