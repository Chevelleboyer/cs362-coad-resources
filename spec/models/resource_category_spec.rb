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
  end
end
