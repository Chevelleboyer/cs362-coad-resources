require 'rails_helper'

RSpec.describe Region, type: :model do

  let(:region) {build(:region)}

  it "has a name" do
    expect(region).to respond_to(:name)
  end

  describe "relationships" do
    it { should have_many(:tickets) }
  end

end
