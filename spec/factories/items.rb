FactoryBot.define do
  factory :item do
    association :merchant
    name { "Cheetos" }
    description { "mmmmmmmm snacks" }
  end
end
