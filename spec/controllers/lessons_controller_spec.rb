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
			# binding.pry
			expect(assigns[:lesson].body).to eq(lesson1.body)
		end

		it 'returns the correct lesson' do
			get :show, id: lesson1.id
			expect(assigns[:lesson].id).to eq(lesson1.id)
			expect(assigns[:lesson].author).to eq(lesson1.author)
			expect(assigns[:lesson].title).to eq(lesson1.title)
			expect(assigns[:lesson].url).to eq(lesson1.url)
			
			# We have to round the times off to prevent tests from failing
			# due to sub-millisecond level time discrepancies
			# the round method takes int arguments to specify how many digits
			# after the seconds number to return: eg: round(3) will give up to milliseconds
			expect(assigns[:lesson].created_at.round).to \
						eq(lesson1.created_at.round)
			expect(assigns[:lesson].updated_at.round).to \
						eq(lesson1.updated_at.round)
		end
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
