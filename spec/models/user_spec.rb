require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) {build(:user)}

  describe "validations" do
    it { should validate_presence_of(:email) }
    it { should validate_length_of(:email) }
    it { should validate_uniqueness_of(:email).case_insensitive }
  end

  describe "relationships" do
    it { should belong_to(:organization).optional }
  end

  describe "methods" do
    it "responds to to_s with the user email" do
      user_email = user.to_s
      expect(user_email).to eq("fake@email.com")
    end
  end

end
