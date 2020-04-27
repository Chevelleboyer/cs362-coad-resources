require 'rails_helper'

RSpec.describe ResourceCategory, type: :model do

  let(:resource_category) {ResourceCategory.new()}

  it "has all of the expected attributes" do 
    expect(resource_category).to respond_to(:name)
  end

end
