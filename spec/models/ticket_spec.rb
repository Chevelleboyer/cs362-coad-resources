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

  end

  describe "::closed" do

    it "gets closed tickets" do
      ticket = create(:ticket, :closed)
      open_tickets = Ticket.open
      expect(open_tickets).not_to include(ticket)
    end

  end

  describe "::all_organization" do

    it "gets tickets that are open with an organization" do
      ticket = create(:ticket, :open, :organization)
      all_organization = Ticket.all_organization
      expect(all_organization).to include(ticket)
    end
    
  end

  describe "::organization" do

    it "gets an open ticket with a specific organization id" do
      ticket = create(:ticket, :open, :organization)
      id = ticket.organization.id
      tickets = Ticket.organization(id)
      expect(tickets).to include(ticket)
    end

  end

  describe "::closed_organization" do

    it "gets a closed ticket with a specific organization id" do
      ticket = create(:ticket, :closed, :organization)
      id = ticket.organization.id
      tickets = Ticket.organization(id)
      expect(tickets).not_to include(ticket)
    end

  end

  describe "::region" do

    it "gets a ticket with a specific region id" do
      ticket = create(:ticket, :region)
      region_id = ticket.region.id
      tickets = Ticket.region(region_id)
      expect(tickets).to include(ticket)
    end

  end

  describe "::resource_category" do
  
    it "gets a ticket with a specific resource_category id" do
      ticket = create(:ticket, :resource_category)
      resource_category_id = ticket.resource_category.id
      tickets = Ticket.resource_category(resource_category_id)
      expect(tickets). to include(ticket)
    end

  end

end
