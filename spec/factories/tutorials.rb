FactoryBot.define do
  factory :tutorial do
    title {Faker::Lorem.sentence}
    content {Faker::Lorem.sentence}
    image {Faker::Avatar.image}
    tuto_category_id {2}
    association :admin 
  end
end
