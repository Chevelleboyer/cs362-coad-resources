require 'rails_helper'

RSpec.describe ResourceCategory, type: :model do

  let(:resource_category) {ResourceCategory.new()}

  it "has a name" do 
    expect(resource_category).to respond_to(:name)
  end

  describe "relationships" do
    it { should have_and_belong_to_many(:organizations) }
    it { should have_many(:tickets) }
  end

end
