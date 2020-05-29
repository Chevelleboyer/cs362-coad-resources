# require 'rails_helper'

# RSpec.describe 'Logging in', type: :feature do

  context " as admin user" do
    it "Logs you in as admin" do
      admin = create(:user, :admin)
      log_in_as(admin)
      visit(dashboard_path)
      expect(current_path).to eq(dashboard_path) 
    end
  end
end