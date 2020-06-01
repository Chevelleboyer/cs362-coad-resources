require 'rails_helper'

RSpec.describe 'Creating an Organization Application', type: :feature do
  let(:user) { create(:user) }
  
  context "as a new user" do

    it "creates a new organization application" do
      create(:user, :admin)
      log_in_as(user)
      visit(dashboard_path)
      click_on("Create Application")
      choose("organization_liability_insurance_true")
      choose("organization_agreement_one_true")
      choose("organization_agreement_two_true")
      choose("organization_agreement_three_true")
      choose("organization_agreement_four_true")
      choose("organization_agreement_five_true")
      choose("organization_agreement_six_true")
      choose("organization_agreement_seven_true")
      choose("organization_agreement_eight_true")
      fill_in("What is your name? (Last, First)", with: "Fakelast, FakeFirst")
      fill_in("Organization Name", with: "Fake Organization Name")
      fill_in("What is your title? (if applicable)", with: "Fake Title")
      fill_in("What is your direct phone number? Cell phone is best.", with: "5415081234")
      fill_in("Who may we contact regarding your organization's application if we are unable to reach you?", 
        with: "Fake Contact")
      fill_in("What is a good secondary phone number we may reach your organization at?", with: "5415084567")
      fill_in("What is your Organization's email?", with: "fakeorg@email.com")
      fill_in("Description", with: "Fake Description")
      choose("organization_transportation_yes")
      click_on("Apply")
      expect(page).to have_content("Application Submitted")
    end

    # it "leaves a field blank while creating a new organization application" do
    #   create(:user, :admin)
    #   log_in_as(user)
    #   visit(dashboard_path)
    #   click_on("Create Application")
    #   choose("organization_liability_insurance_true")
    #   click_on("Apply")
    #   expect(page).to have_content("Select one of these options")
    # end

    it "leaves email field blank while crating a new organization application" do
      create(:user, :admin)
      log_in_as(user)
      visit(dashboard_path)
      click_on("Create Application")
      click_on("Apply")
      expect(page).to have_content("Email can't be blank")
    end

  end

end
