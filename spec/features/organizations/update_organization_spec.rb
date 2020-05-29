require 'rails_helper'

RSpec.describe 'Updating an Organization', type: :feature do
    let(:admin) { create(:user, :admin) }
    let(:organization) { create(:organization, :approved) }

    before do
      create(:user, organization: organization)
    end

    context "as an admin" do
      it "updates an organization" do
        log_in_as(admin)
        visit(organization_path(organization))
        click_on("Edit Organization")
        fill_in("Name", with: "Fake Name")
        click_on("Update Resource")
        expect(page).to have_content("Fake Name")
      end
    end
end
