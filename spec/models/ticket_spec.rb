require 'rails_helper'

RSpec.describe Ticket, type: :model do

  let(:ticket) {build(:ticket)}

  it "has a name" do
    expect(ticket).to respond_to(:name)
  end

  it "has a phone" do
    expect(ticket).to respond_to(:phone)
  end

  it "has a region_id" do
    expect(ticket).to respond_to(:region_id)
  end

  it "has a resource_category_id" do
    expect(ticket).to respond_to(:resource_category_id)
  end

  describe "ticket relationships" do
    it { should belong_to(:region) }
    it { should belong_to(:resource_category) }
    it { should belong_to(:organization) }
  end

end
