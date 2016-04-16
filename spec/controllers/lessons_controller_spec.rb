require 'spec_helper'
require 'pry'

RSpec.describe LessonsController, type: :controller do
		let(:lesson1) {FactoryGirl.create(:lesson)}
		let(:lesson2) {FactoryGirl.create(:lesson)}  # , url: "securl", author: "Juan")}
		let(:lesson3) {FactoryGirl.create(:lesson)}  #, title: "firsturl", author: "agam")}

	describe 'GET / index' do

		it 'returns an http success' do
			get :index
			expect(response).to be_success
		end

		it 'returns all the lessons' do
			get :index 
			lessons = [lesson1, lesson2]
			expect(assigns[:lessons]).to eq(lessons)
		end
	end

	describe 'GET /# show' do
		it 'returns an http success' do
			get :show, id: lesson1.id
			expect(response).to be_success
		end

		it 'returns a single lesson' do
			get :show, id: lesson1.id
			expect(assigns[:lesson]).to eq(lesson1)
		end

		it 'returns the correct lesson' do
			get :show, id: lesson2.id
			expect(assigns[:lesson]).to eq(lesson2)
		end
	end

	describe 'GET /new' do
		it 'returns an http success when form loaded'		
		it 'returns a valid form, with fields for all necessary information'
	end

	describe 'POST / create' do
		it 'returns an http created when lesson saved' 
		it 'returns an http failed when lesson not saved'

		it 'returns model message when lesson not saved'

		it 'adds a new lesson when form is submitted'

		it 'keeps the admin on the form to create a new one'
		
		it 'does not create a duplicate lesson'

	end
end
