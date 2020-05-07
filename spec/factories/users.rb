FactoryBot.define do
    factory :user do
      email { "fake@email.com"}
      encrypted_password { "FAKEPASSWORD" }
    end
  end