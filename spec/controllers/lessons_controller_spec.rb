require 'rails_helper'

RSpec.describe LessonsController, type: :controller do

	describe 'GET / index' do
		it 'returns an http success' do
			get :index
			expect(response).to be_success

		end

		it 'returns all the lessons'

		it 'shows all the lessons'

		it 'has a summary of each lesson'
	end

	describe 'GET /# show' do
		it 'returns an http success'

		it 'returns a single lesson'

		it 'returns the correct lesson'

		it 'shows a body for the lesson'

		it 'shows the creator of the lesson'

		it 'shows the creator of the lesson'

	end

	describe 'GET /new create' do
		it 'returns an http success'

		it 'shows a form for a new lesson'

		it 'adds a new lesson when form is submitted'

		it 'does not repeat lesson urls'

		it 'does not allow to submit a lesson unless everything in the form is filled out'

		it 'keeps the admin on the form to create a new one'
	end

end
