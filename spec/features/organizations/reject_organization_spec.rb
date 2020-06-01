require 'rails_helper'

RSpec.describe 'Rejecting an organization', type: :feature do

  let(:organization) { create(:organization, :submitted) }
  let(:user) { create(:user, :admin) }
  
  context "as an admin" do

    it "rejects an organization" do
      log_in_as(user)
      visit(organization_path(organization))
      fill_in("organization_rejection_reason", with: "Reason")
      click_on("Reject")
      expect(page).to have_content("#{organization.name} has been rejected.")
    end

    it "rejects a rejected organization" do
      log_in_as(user)
      visit(organization_path(organization))
      fill_in("organization_rejection_reason", with: "Reason")
      click_on("Reject")
      visit(organization_path(organization))
      expect(page).not_to have_selector("Reject")
    end

    it "rejects an approved organization" do
      log_in_as(user)
      visit(organization_path(organization))
      click_on("Approve")
      visit(organization_path(organization))
      expect(page).not_to have_selector("Reject")
    end

  end

end
