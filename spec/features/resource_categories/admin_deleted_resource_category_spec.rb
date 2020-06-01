require 'rails_helper'

RSpec.describe 'Deleting a Resource Category', type: :feature do
  let(:user) { create(:user, :admin) }
  let(:resource_category) { create(:resource_category) }

  context "as an admin" do

    it "deletes a resource category" do 
      log_in_as(user)
      visit(resource_category_path(resource_category.id))
      click_on("Delete")
      expect(page).to have_content("Category #{resource_category.name} was deleted")
    end

  end

end
