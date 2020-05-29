require 'rails_helper'

RSpec.describe Ticket, type: :model do

  let(:ticket) {build(:ticket)}

  describe "validations" do
    it "has a name" do
      expect(ticket).to respond_to(:name)
    end

    it "has a phone" do
      expect(ticket).to respond_to(:phone)
    end

    it "has a region_id" do
      expect(ticket).to respond_to(:region_id)
    end

    it "has a resource_category_id" do
      expect(ticket).to respond_to(:resource_category_id)
    end
  end

  describe "relationships" do
    it { should belong_to(:region) }
    it { should belong_to(:resource_category) }
    it { should belong_to(:organization).optional }
  end

  describe "methods" do
    it "is open by default" do
      expect(ticket.open?).to be true
    end

    it "it has no organization by default" do
      expect(ticket.captured?).to be false
    end

    it "responds to to_s with Ticket (id)" do
      ticket_name = ticket.to_s
      expect(ticket_name).to eq("Ticket #{ticket.id}")
    end
  end

  describe "::open" do

    it "gets open tickets with no organization" do
      ticket_persist = create(:ticket, :open)
      open_tickets = Ticket.open
      expect(open_tickets).to include(ticket_persist)
    end

    it "gets closed tickets" do
      ticket = create(:ticket, :closed)
      open_tickets = Ticket.open
      expect(open_tickets).not_to include(ticket)
    end

  end

end
