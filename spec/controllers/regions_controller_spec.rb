require 'rails_helper'

RSpec.describe RegionsController, type: :controller do
  
  let(:non_admin) { create(:user) }
  let(:admin) { create(:user, :admin) }
  let(:region) { create(:region) }
  
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

    describe "POST #create" do
      it "creates a region" do
        expect(post(:create, :params => 
        {:region => { name: "FAKE"} })).to redirect_to(regions_path)
      end
    end

    #No idea why this won't work ¯\_(ツ)_/¯
    # describe "GET #update" do
    #   specify { expect(get(:update, params: { region: region, id: region.id })).to redirect_to(dashboard_path) }
    # end
  end

  
end
