require 'rails_helper'

RSpec.describe 'Creating a Region', type: :feature do
  
  let(:user) { create(:user, :admin) }
  
  context "as an admin" do
    it "creates a new region" do
      log_in_as(user)
      visit(new_region_path)
      fill_in("Name", with: "Fake Region")
      click_on("Add Region")
      expect(page).to have_content("Region successfully created")
    end
  end
  
end
