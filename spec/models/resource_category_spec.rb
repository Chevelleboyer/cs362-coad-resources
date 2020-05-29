require 'rails_helper'

RSpec.describe ResourceCategory, type: :model do

  let(:resource_category) {build(:resource_category)}

  describe "validations" do
    it "has a name" do 
      expect(resource_category).to respond_to(:name)
    end

    it { should validate_length_of(:name) }
    it { should validate_uniqueness_of(:name).case_insensitive }

  end
  
  describe "relationships" do
    it { should have_and_belong_to_many(:organizations) }
    it { should have_many(:tickets) }
  end

  describe "methods" do

    it "sets active to true" do
      resource_category.activate
      expect(resource_category.inactive?).to be false
    end

    it "sets active to false" do
      resource_category.deactivate
      expect(resource_category.inactive?).to be true
    end
    
    it "responds to to_s with name" do
      res_cat_name = resource_category.to_s
      expect(res_cat_name).to eq("FAKE")
    end

    it "finds or creates unspecified resource category" do
      unspecified_res_cat = ResourceCategory.unspecified
      unspec_res_cat_name = unspecified_res_cat.to_s
      expect(unspec_res_cat_name).to eq("Unspecified")
    end

  end

  describe "::active" do

    it "gets all active resource categories" do
      resource_category = create(:resource_category, :active)
      active_resource_categories = ResourceCategory.active
      expect(active_resource_categories).to include(resource_category)
    end

    it "gets all inactive resource_categories" do
      resource_category = create(:resource_category, :inactive)
      active_resource_categories = ResourceCategory.active
      expect(active_resource_categories).not_to include(resource_category)
    end

  end

  describe "::inactive" do

    it "gets all inactive resource_categories" do
      resource_category = create(:resource_category, :inactive)
      inactive_resource_categories = ResourceCategory.inactive
      expect(inactive_resource_categories).to include(resource_category)
    end

  end

end
