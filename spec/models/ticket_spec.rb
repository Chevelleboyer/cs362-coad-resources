require 'rails_helper'

RSpec.describe Ticket, type: :model do
  it "exists" do
    Ticket.new()
  end

  it "checks for a name attribute" do
    expect(Ticket).to respond_to(:name)
  end

end
