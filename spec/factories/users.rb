FactoryBot.define do
  factory :user do
    sequence(:email) { |n| "fake#{n}@email.com" }
    password { "FAKEPASSWORD" }
    
    trait :admin do
      role { :admin }
    end

    after :create do |user|
      user.confirm
    end
  end
end