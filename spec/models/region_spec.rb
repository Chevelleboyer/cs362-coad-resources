require 'rails_helper'

RSpec.describe Region, type: :model do

  it "has all of the expected attributes" do
    region = Region.new()
    expect(region).to respond_to(:name)
  end
  
end
