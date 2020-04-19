require 'rails_helper'

RSpec.describe Ticket, type: :model do
  it "exists" do
    Ticket.new()
  end

  it "has all of the expected attributes" do
    ticket = Ticket.new()
    expect(ticket).to respond_to(
      :name,
      :phone,
      :region_id,
      :resource_category_id
    )
    
  end

end
