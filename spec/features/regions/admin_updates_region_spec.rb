RSpec.describe 'Deleting a Region', type: :feature do

  let(:user) { create(:user, :admin) }
  let(:region) { create(:region) }
  
  context "as an admin" do
  
    it "updates a region" do
      log_in_as(user)
      visit(edit_region_path(region.id))
      fill_in("Name", with: "FAKE")
      click_on("Save Changes")
      expect(page).to have_content("Region successfully updated.")
    end
  
  end
  
end