require 'rails_helper'

RSpec.describe 'Logging in', type: :feature do
  let(:resource_category) { create(:resource_category) }
  let(:region) { create(:region) }
  let(:ticket) { create(:ticket, region: region, resource_category: resource_category) }
  let(:organization) { create(:organization, :approved) }

  context "as admin user" do

    it "Logs you in as admin" do
      admin = create(:user, :admin)
      log_in_as(admin)
      visit(dashboard_path)
      expect(current_path).to eq(dashboard_path) 
    end

  end

  context "as a non-admin user" do

  	it "Logs you in" do
  		user = create(:user, organization: organization)
  		log_in_as(user)
  		visit(dashboard_path)
  		expect(current_path).to eq(dashboard_path)
  	end

  end
  
end