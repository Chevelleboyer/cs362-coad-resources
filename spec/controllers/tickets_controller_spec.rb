require 'rails_helper'

RSpec.describe TicketsController, type: :controller do
  let(:organization) { create(:organization, :approved) }
  let(:user) { create(:user, organization: organization) }
  let(:admin) { create(:user, :admin, organization: organization) }

  context "as a non-admin user" do
    before(:each) { sign_in(user) }

    describe "POST #create" do
      it "creates a ticket" do
        ticket = create(:ticket)
        expect(post(:create, :params =>
        {:ticket => {
          :name => ticket.name,
          :phone => ticket.phone,
          :description => "FAKE",
          :region_id => 1,
          :resource_category_id => 1}
        })).to redirect_to(ticket_submitted_path)
      end
    end

    describe "GET #capture" do
      it "captures a ticket" do
        new_ticket = create(:ticket)
        expect(get(:capture, :params => 
        {:ticket => new_ticket,
         :id => new_ticket.id})).to redirect_to(dashboard_path << "#tickets:open")
      end
    end
  end

  context "as an admin" do
    before(:each) { sign_in(admin) }

    describe "GET #release" do
      it "releases a ticket" do
        new_ticket = create(:ticket)
        expect(get(:release, :params =>
        {:ticket => new_ticket,
         :id => new_ticket.id})).to redirect_to(dashboard_path << "#tickets:captured")
      end
    end

    describe "GET #close" do
      it "closes a ticket" do
        new_ticket = create(:ticket)
        expect(get(:close, :params =>
        {:ticket => new_ticket,
         :id => new_ticket.id})).to redirect_to(dashboard_path << "#tickets:open")
      end
    end

    describe "GET #destroy" do
      it "destroys a ticket" do
        new_ticket = create(:ticket)
        expect(get(:destroy, :params => 
        {:ticket => new_ticket,
         :id => new_ticket.id})).to redirect_to(dashboard_path << "#tickets")
      end
    end
  end
end
