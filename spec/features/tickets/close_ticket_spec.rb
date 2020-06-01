require 'rails_helper'

RSpec.describe 'Closing a ticket', type: :feature do
    let(:resource_category) { create(:resource_category) }
    let(:region) { create(:region) }
    let(:organization) { create(:organization, :approved) }
    let(:user) { create(:user, organization: organization) }
    let(:user_admin) { create(:user, :admin) }
    let(:ticket) { create(:ticket, organization: user.organization, 
        region: region, resource_category: resource_category,) } 

    context "user with organization" do

      it "closes a ticket" do
        log_in_as(user)
        visit(ticket_path(ticket.id))
        expect(ticket.open?).to be true
        expect(ticket.captured?).to be true
        click_on("Close")
        visit(ticket_path(ticket.id))
        expect(page).to have_no_link("Close")
        expect(ticket.captured?).to be true
      end

    end

    context "as an admin" do

        it "closes a ticket" do
            log_in_as(user)
            visit(ticket_path(ticket.id))
            click_on("Close")
            visit(ticket_path(ticket.id))
            expect(page).to have_no_link("Close")
        end
    end

end
