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
  end
end
