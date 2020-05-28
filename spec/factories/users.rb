FactoryBot.define do
  factory :user do
    email { "fake@email.com" }
    password { "FAKEPASSWORD" }
    
    trait :admin do
      role { :admin }
    end
  end
end