require 'rails_helper'

RSpec.describe RegionsController, type: :controller do
  
  let(:non_admin) { create(:user) }
  let(:admin) { create(:user, :admin) }

  context "as a non-admin user" do
    before(:each) { sign_in(non_admin) }

    describe "GET #index" do
      specify { expect(get(:index)).to redirect_to(dashboard_path)}
    end
  end

  context "as a new user" do
    describe "GET #index" do
      specify { expect(get(:index)).to redirect_to(new_user_session_path)}
    end
  end

  context "as an admin" do
    before(:each) { sign_in(admin) }

    describe "GET #index" do
      specify { expect(get(:index)).to be_successful }
    end
  end
end
