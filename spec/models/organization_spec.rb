require 'rails_helper'

RSpec.describe Organization, type: :model do
  it "exists" do
    Organization.new()
  end

  it "checks for a name attribute" do
    expect(Organization).to respond_to(:name)
  end

#   it "checks for a email attribute" do
#     expect(Organization).to respond_to(:status)
#   end
end
