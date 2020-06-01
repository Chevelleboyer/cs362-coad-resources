require 'rails_helper'

RSpec.describe OrganizationsController, type: :controller do

	class FakeMailer
		def new_organization_application
			false
		end
	end

	context 'Organization User' do

		describe 'POST #create' do

			let(:user) do
				User.create(email: 'fake@fake.com',
					password: 'password',
					password_confirmation: 'password',
					role: 'organization')
			end

			before do
				user.confirm
				admin = User.create(email: 'fakeadmin@fake.com',
					password: 'password',
					password_confirmation: 'password',
					role: 'admin')
				admin.confirm
				sign_in(user)
			end

			it 'suceeds' do
				expect(
					post(
						:create,
						params: {
							organization: {name: 'Fake',
								email: 'fake@fake.com',
								phone: '1306666969',
								primary_name: 'fake primary name',
								secondary_name: 'fake secondary name',
								secondary_phone: '1306966669'
							},
						}
					)
				).to redirect_to(organization_application_submitted_path)
			end

		end

	end

end
