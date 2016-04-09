require 'spec_helper'
require 'pry'

RSpec.describe LessonsController, type: :controller do

	let(:lesson1) {FactoryGirl.create(:lesson)}
	let(:lesson2) {FactoryGirl.create(:lesson, body: "Mashed potatoes")}

	describe 'GET / index', :focus => true do
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
			expect(assigns[:lesson]).to eq(lesson1)
		end

		it 'returns the correct lesson' do
			get :show, id: lesson2.id
			expect(assigns[:lesson]).to eq(lesson2)
		end
	end

	describe 'GET /new' do
		it 'returns an http success when form loaded' do
			get :new
			expect(response).to be_success
		end
		
		it 'returns a valid form, with fields for all necessary information' do

		end
	end

	describe 'POST / create' do
		it 'returns an http created when lesson saved' do
			get :create, author: lesson1.author, title: lesson1.title,\
					body: lesson1.body, url: lesson1.url
			# binding.pry
			# returns http status code 201?
			# there's probably some better way, but I don't know it
			# response.code gets http code
			expect(response.code).to eq("201")
		end

		it 'returns an http failed when lesson not saved'

		it 'returns model message when lesson not saved'

		it 'adds a new lesson when form is submitted'

		it 'keeps the admin on the form to create a new one'
		
		# this one may be taken care of by the lesson model, so we may not need to
		# test it here
		it 'doesn\'t create a duplicate lesson'

	end

end
