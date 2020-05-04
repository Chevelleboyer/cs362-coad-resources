require 'rails_helper'

RSpec.describe Organization, type: :model do

	let(:organization) { Organization.new }

	describe "attributes" do

		it "should respond to agreement_one" do
			expect(organization).to respond_to(:agreement_one)
		end

		it "should respond to agreement_two" do
			expect(organization).to respond_to(:agreement_two)
		end

		it "should respond to agreement_three" do
			expect(organization).to respond_to(:agreement_three)
		end

		it "should respond to agreement_four" do
			expect(organization).to respond_to(:agreement_four)
		end

		it "should respond to agreement_five" do
			expect(organization).to respond_to(:agreement_five)
		end

		it "should respond to agreement_six" do
			expect(organization).to respond_to(:agreement_six)
		end

		it "should respond to agreement_seven" do
			expect(organization).to respond_to(:agreement_seven)
		end

		it "should respond to agreement_eight" do
			expect(organization).to respond_to(:agreement_eight)
		end

		it "should respond to name" do
			expect(organization).to respond_to(:name)
		end

		it "should respond to status" do
			expect(organization).to respond_to(:status)
		end

		it "should respond to phone" do
			expect(organization).to respond_to(:phone)
		end

		it "should respond to email" do
			expect(organization).to respond_to(:email)
		end

		it "should respond to description" do
			expect(organization).to respond_to(:description)
		end

		it "should respond to rejection_reason" do
			expect(organization).to respond_to(:rejection_reason)
		end

		it "should respond to liability_insurance" do
			expect(organization).to respond_to(:liability_insurance)
		end

		it "should respond to primary_name" do
			expect(organization).to respond_to(:primary_name)
		end

		it "should respond to secondary_name" do
			expect(organization).to respond_to(:secondary_name)
		end

		it "should respond to secondary_phone" do
			expect(organization).to respond_to(:secondary_phone)
		end

		it "should respond to title" do
			expect(organization).to respond_to(:title)
		end

		it "should respond to transportation" do
			expect(organization).to respond_to(:transportation)
		end

	end

	describe "relationships" do

		it "has many users" do
			expect(organization).to have_many(:users)
		end

		it "has many tickets" do
			expect(organization).to have_many(:tickets)
		end

		it "has and belongs to many resource_categories" do
			expect(organization).to have_and_belong_to_many(:resource_categories)
		end

	end

	describe "validations" do

		it "validates presence of email" do
			expect(organization).to validate_presence_of(:email)
		end

		it "validates presence of name" do
			expect(organization).to validate_presence_of(:name)
		end

		it "validates presence of phone" do
			expect(organization).to validate_presence_of(:phone)
		end

		it "validates presence of status" do
			expect(organization).to validate_presence_of(:status)
		end

		it "validates presence of primary_name" do
			expect(organization).to validate_presence_of(:primary_name)
		end

		it "validates presence of secondary_name" do
			expect(organization).to validate_presence_of(:secondary_name)
		end

		it "validates presence of secondary_phone" do
			expect(organization).to validate_presence_of(:secondary_phone)
		end
		
		it "validates length of email" do
			expect(organization).to validate_length_of(:email).is_at_least(1).is_at_most(255).on(:create)
		end

		it "validates uniqueness of email" do
			expect(organization).to validate_uniqueness_of(:email).case_insensitive
		end

		it "validates length of name" do
			expect(organization).to validate_length_of(:name).is_at_least(1).is_at_most(255).on(:create)
		end

		it "validates uniqueness of name" do
			expect(organization).to validate_uniqueness_of(:name).case_insensitive
		end

		it "validates length of description" do
			expect(organization).to validate_length_of(:description).is_at_most(1020).on(:create)
		end

	end

	describe "#approve" do

		it "checks status is approved" do
			organization.approve
			expect(organization.status).to eq("approved")
		end

	end

end

