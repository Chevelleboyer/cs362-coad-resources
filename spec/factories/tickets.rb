FactoryBot.define do
  factory :ticket do
    name { "Fake" }
    phone { "15415082244" }
    sequence(:id, 1) { |n| n }
  end
end