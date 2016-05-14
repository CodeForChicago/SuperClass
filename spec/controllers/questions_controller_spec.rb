require 'spec_helper'

describe QuestionsController, type: :controller do
    let(:question1) {FactoryGirl.create(:question)}
    let(:question2) {FactoryGirl.create(:question)}
    
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
    
    describe 'GET /new', :focus do
        it 'returns a form if user signed in' do
            sign_in FactoryGirl.create(:user)
            get :new
            expect(assigns[:question]).to be_a(Question)
        end
        
        subject {get :new}
        
        it 'redirects to sign in if user not signed in' do
            expect(subject).to redirect_to(new_user_session_path)
        end
    end
end
