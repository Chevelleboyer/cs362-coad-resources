require 'rails_helper'

RSpec.describe 'User registration', type: :feature do

  context "as new user" do

    it "lets you create an account with an email and password" do
      new_email = "new@email.com"
      new_password = "new_pass"
      visit(new_user_registration_path)
      fill_in("Email", with: new_email)
      fill_in("Password", with: new_password)
      fill_in("Password confirmation", with: new_password)
      click_on("commit")
      new_user = User.find_by(email: new_email)
      visit(user_confirmation_path(confirmation_token: new_user.confirmation_token))
      expect(page).to have_content("Your email address has been successfully confirmed")
    end

    it "leaves email field blank" do
      new_password = "new_pass"

      visit(new_user_registration_path)
      fill_in("Password", with: new_password)
      fill_in("Password confirmation", with: new_password)
      click_on("commit")
      expect(current_path).to eq("/users")
    end

  end

end
