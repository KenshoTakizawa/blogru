FactoryBot.define do
  factory :profile do
    nickname {Faker::Name.name}
    learning_history {Faker::Lorem.sentence}
    purpose {Faker::Lorem.sentence}
    birth_date {Faker::Date.backward}
    association :user 
  end
end
