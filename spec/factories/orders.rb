FactoryBot.define do
  factory :order do

    price {2000}
    association :user 
    association :teacher 
    token {"tok_abcdefghijk00000000000000000"}

  end
end
