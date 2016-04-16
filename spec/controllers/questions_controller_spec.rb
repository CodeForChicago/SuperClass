require 'spec_helper'

describe QuestionsController, type: :controller do
    
    describe 'GET / index' do
        it 'returns an http success' do
            get :index
            expect(response).to be_success
        end
        
        it 'returns all the questions' do
           question1 = FactoryGirl.create(:question)
           question2 = FactoryGirl.create(:question)
           questions = [question1, question2]
           get :index
           expect(assigns[:questions]).to eq(questions)
        end
    end
end