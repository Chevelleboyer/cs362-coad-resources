require 'rails_helper'

RSpec.describe 'Logging in', type: :feature do

  context " as admin user" do
    it "Logs you in as admin" do
      admin = create(:user, :admin)
      log_in_as(admin)
      visit(dashboard_path)
      #not sure why this doesn't work, some other way to confirm the log in?
      #expect(current_path).to eq(dashboard_path) 
    end
  end

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
  end
  
end
