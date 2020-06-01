require 'rails_helper'

RSpec.describe 'Deleting a Region', type: :feature do

  let(:user) { create(:user, :admin) }
  let(:region) { create(:region) }

  context "as an admin" do

    it "deletes a region" do
      log_in_as(user)
      visit(region_path(region.id))
      click_on("Delete")
      expect(page).to have_content("Region #{region.name} was deleted")
    end

  end

end
