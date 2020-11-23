FactoryBot.define do
  factory :tip do
    title {Faker::Lorem.sentence}
    content {Faker::Lorem.sentence}
    image {Faker::Avatar.image}
    association :admin 
  end
end
