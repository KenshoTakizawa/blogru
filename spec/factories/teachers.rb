FactoryBot.define do
  factory :teacher do
    teach_content {Faker::Lorem.sentence}
    teach_detail {Faker::Lorem.sentence}
    teacher_history {Faker::Lorem.sentence}
    nickname {Faker::Name.name}
    plan_id {2}
    email                 {Faker::Internet.email}
    password              {"1234567"}
  end
end
