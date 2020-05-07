require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) {build(:user)}

  describe "validations" do
    it { should validate_presence_of(:email)}
  end

end
