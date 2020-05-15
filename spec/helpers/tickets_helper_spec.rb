require 'rails_helper'

# Specs in this file have access to a helper object that includes
# the TIcketsHelper. For example:
#
# describe TIcketsHelper do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       expect(helper.concat_strings("this","that")).to eq("this that")
#     end
#   end
# end
RSpec.describe TicketsHelper, type: :helper do

  let(:ticket) {build(:ticket)}
  phone_number = "1234567890"
  
  describe "#format_phone_number" do
    it "returns a formatted phone number" do
      expect(format_phone_number(phone_number)).to eq("+1234567890")
    end
  end

end
