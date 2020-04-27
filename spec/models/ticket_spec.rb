require 'rails_helper'

RSpec.describe Ticket, type: :model do

  it "has all of the expected attributes" do
    ticket = Ticket.new()
    expect(ticket).to respond_to(:name)
    expect(ticket).to respond_to(:phone)
    expect(ticket).to respond_to(:region_id)
    expect(ticket).to respond_to(:resource_category_id)
    
  end

end
