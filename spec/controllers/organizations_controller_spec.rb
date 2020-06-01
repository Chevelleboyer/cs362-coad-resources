require 'rails_helper'

RSpec.describe OrganizationsController, type: :controller do

	class FakeMailer
		def new_organization_application
			false
		end
	end

end
