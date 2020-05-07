FactoryBot.define do
    factory :user do
      email { "fake@email.com"}
      encrypted_password { "FAKEPASSWORD" }
      role { 1 }
    end
  end