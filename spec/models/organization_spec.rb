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

