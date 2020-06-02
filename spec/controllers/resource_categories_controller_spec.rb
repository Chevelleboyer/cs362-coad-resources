require 'rails_helper'

RSpec.describe ResourceCategoriesController, type: :controller do
  let(:non_admin) { create(:user) }
  let(:admin) { create(:user, :admin) }  

  context "as a non-admin user" do
    before(:each) { sign_in(non_admin) }

    describe "GET #index" do
      specify { expect(get(:index)).to redirect_to(dashboard_path)}
    end
    
    describe "GET #new" do
      specify { expect(get(:new)).to redirect_to(dashboard_path)}
    end

  end

  context "as an admin user" do
    before(:each) { sign_in(admin) }

    describe "POST #create" do
      it "creates a resource category" do
        expect(post(:create, :params => 
        {:resource_category => { name: "FAKE"} })).to redirect_to(resource_categories_path)
      end
    end
    
    # describe "GET #activate" do
    #   it "activates a resource category" do
    #     resource_category = create(:resource_category, active: false)
    #     #expect(get(:activate, :params => 
    #     #{:resource_category => resource_category})).to redirect_to(resource_categories_path(resource_category))
    #     get(:activate, :params => {:resource_category => resource_category})
    #   end
    # end
  end

end
