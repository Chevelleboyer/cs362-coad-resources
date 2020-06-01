require 'rails_helper'

RSpec.describe 'Deleting a Ticket', type: :feature do

  let(:resource_category) { create(:resource_category) }
  let(:region) { create(:region) }
  let(:ticket) { create(:ticket, region: region, resource_category: resource_category) }
  let(:user) { create(:user, :admin) }

  context "as an admin" do

    it "deletes a ticket" do
      log_in_as(user)
      visit(ticket_path(ticket.id))
      click_on("Delete")
      expect(page).to have_content("Ticket #{ticket.id} was deleted.")
    end

    it "is not visible" do
      log_in_as(user)
      expect(page).not_to have_selector('id', :text => ticket.id)
    end

  end
  
end
