require 'rails_helper'

RSpec.describe Organization, type: :model do
  it "exists" do
    Organization.new()
  end

  it "has all of the expected attributes" do
    organization = Organization.new()
    expect(organization).to respond_to(
      :email,
      :name,
      :phone,
      :status,
      :primary_name,
      :secondary_name,
      :secondary_phone
    )
  end

#   it "checks for a email attribute" do
#     expect(Organization).to respond_to(:status)
#   end
end
