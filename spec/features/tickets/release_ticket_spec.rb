require 'rails_helper'

RSpec.describe 'Releasing a ticket by an', type: :feature do
  let(:resource_category) { create(:resource_category) }
  let(:region) { create(:region) }
  let(:organization) { create(:organization, :approved) }
  let(:user) { create(:user, organization: organization) }
  let(:ticket) { create(:ticket, organization: user.organization,
    region: region, resource_category: resource_category,) }  
  
  context "user with organization" do  
    it "is released by the user" do
      log_in_as(user)
      visit(ticket_path(ticket.id))
      expect(ticket.captured?).to be true
      click_on("Release")
      expect(ticket.open?).to be true
    end
  end
end
