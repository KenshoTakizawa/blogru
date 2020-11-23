FactoryBot.define do
  factory :user do
    id {Faker::Number.number}
    email                 {"sample@gmail.com"}
    password              {"1234567"}
  end
end
