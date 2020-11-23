FactoryBot.define do
  factory :admin do
    email                 {Faker::Internet.email}
    password              {"1234567"}
  end
end
