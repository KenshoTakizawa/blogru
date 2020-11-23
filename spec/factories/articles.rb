FactoryBot.define do
  factory :article do
    id {Faker::Number.number}
    title {Faker::Lorem.sentence}
    content {Faker::Lorem.sentence}
    image {Faker::Lorem.sentence}
    category_id {2}
    association :user 
  end
end
