require 'spec_helper'

describe QuestionsController, type: :controller do
    question1 = FactoryGirl.create(:question)
    question2 = FactoryGirl.create(:question)
    
    describe 'GET / index' do
        it 'returns an http success' do
            get :index
            expect(response).to be_success
        end
        
        it 'returns all the questions' do
           questions = [question1, question2]
           get :index
           expect(assigns[:questions]).to eq(questions)
        end
    end
    
    describe 'GET /# show' do
       it 'returns an http success' do
           get :show, id: question1.id
           expect(response).to be_success
       end
       
       it 'returns a single question' do
           get :show, id: question1.id
           expect(assigns[:question]).to eq(question1)
       end
       
       it 'returns the correct question' do
           get :show, id: question2.id
           expect(assigns[:question]).to eq(question2)
       end
    end
end