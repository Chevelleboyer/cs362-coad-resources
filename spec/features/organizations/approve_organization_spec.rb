require 'rails_helper'

RSpec.describe 'Approving an organization', type: :feature do
  let(:organization) { create(:organization, :submitted) }
  let(:user) { create(:user, :admin) }

  context "as an admin" do
    it "approves an organization" do
      log_in_as(user)
      visit(organization_path(organization))
      click_on("Approve")
      expect(page).to have_content("#{organization.name} has been approved.")
    end
  end
end
