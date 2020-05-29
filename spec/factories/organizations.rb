FactoryBot.define do
  factory :organization do
    name { "FAKE" }
    primary_name { "Primary" }
    secondary_name { "Secondary" }
    email { "fake@email.com" }
    phone { "5415081234" }
    secondary_phone { "5415084321" }

    trait :approved do
      status { :approved }
    end
  end

end