require 'spec_helper'
require 'pry'

RSpec.describe LessonsController, type: :controller do

	let(:lesson1) {FactoryGirl.create(:lesson)}
	let(:lesson2) {FactoryGirl.create(:lesson)}

	describe 'GET / index' do
		it 'returns an http success' do
			get :index
			expect(response).to be_success

		end

		it 'returns all the lessons' do
			get :index 
			expect(assigns[:lessons]).to eq([])
			# this causes the lessons to be created 
			lessons = [lesson1, lesson2]
			# use `.reload` to force a new query:
			expect(assigns[:lessons].reload).to eq(lessons)
		end

	end

	describe 'GET /# show' do
		it 'returns an http success' do
			get :show, id: lesson1.id
			expect(response).to be_success
		end

		it 'returns a single lesson' do
			get :show, id: lesson1.id
			expect(assigns[:lesson].body).to eq(lesson1.body)
		end


		it 'returns the correct lesson'

	end

	describe 'GET /new' do
		it 'returns an http success when form loaded'

	end

	describe 'POST / create' do
		it 'returns an http created when lesson saved'

		it 'returns an http failed when lesson not saved'

		it 'returns model message when lesson not saved'

		it 'adds a new lesson when form is submitted'

		it 'keeps the admin on the form to create a new one'

	end

end
