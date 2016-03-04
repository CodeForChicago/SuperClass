require 'rails_helper'

RSpec.describe LessonsController, type: :controller do

	describe 'GET index' do
		it 'returns an http success' do
			get :index
			expect(response).to be_success
		end
	end

end
