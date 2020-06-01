require 'rails_helper'

RSpec.describe 'Creating a Ticket', type: :feature do
  context "As an unregistered user" do

    it "creates a new ticket" do
      region = create(:region)
      resource_category = create(:resource_category)
      
      visit(new_ticket_path)
      fill_in("Full Name", with: "First Last")
      fill_in("Phone Number", with: "5415081234")
      select region.name, from: "Region"
      select resource_category.name, from: "Resource Category"
      fill_in("Description", with: "Description")
      click_on("Send this help request")
      expect(page).to have_content("Ticket Submitted")
    end

    it "creates a new ticket with no name field" do
      region = create(:region)
      resource_category = create(:resource_category)

      visit(new_ticket_path)
      fill_in("Phone Number", with: "5415081234")
      select region.name, from: "Region"
      select resource_category.name, from: "Resource Category"
      fill_in("Description", with: "Description")
      click_on("Send this help request")
      expect(page).not_to have_content("Ticket Submitted")
    end

    it "creates a new ticket with no phone number field" do
      region = create(:region)
      resource_category = create(:resource_category)

      visit(new_ticket_path)
      fill_in("Full Name", with: "First Last")
      select region.name, from: "Region"
      select resource_category.name, from: "Resource Category"
      fill_in("Description", with: "Description")
      click_on("Send this help request")
      expect(page).not_to have_content("Ticket Submitted")
    end

    it "create a new ticket with no region selected" do
      resource_category = create(:resource_category)

      visit(new_ticket_path)
      fill_in("Full Name", with: "First Last")
      fill_in("Phone Number", with: "5415081234")
      select resource_category.name, from: "Resource Category"
      fill_in("Description", with: "Description")
      click_on("Send this help request")
      expect(page).not_to have_content("Ticket Submitted")
    end

    it "create a new ticket with no resource category selected" do
      region = create(:region)

      visit(new_ticket_path)
      fill_in("Full Name", with: "First Last")
      fill_in("Phone Number", with: "5415081234")
      select region.name, from: "Region"
      fill_in("Description", with: "Description")
      click_on("Send this help request")
      expect(page).not_to have_content("Ticket Submitted")
    end

  end

end
