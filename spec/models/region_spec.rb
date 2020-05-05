require 'rails_helper'

RSpec.describe Region, type: :model do

  let(:region) {build(:region)}

  describe "validations" do
    it "has a name" do
      expect(region).to respond_to(:name)
    end

    it { should validate_length_of(:name) }
    it { should validate_uniqueness_of(:name).case_insensitive }
  
  end
  
  describe "relationships" do
    it { should have_many(:tickets) }
  end

  describe "methods" do 
    it "responds to to_s with name" do
      region_name = region.to_s
      expect(region_name).to eq("FAKE")
    end  
  end

end
