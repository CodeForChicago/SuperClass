require 'spec_helper'

describe ProfilesController, type: :controller do
    let(:user1) {FactoryGirl.create(:user)}
    
    describe 'GET /# show' do
        it 'returns a user profile page' do
            get :show, id: user1.id
            expect(response).to be_success
        end
        it 'returns the user\'s name?' do
           get :show, id: user1.id
           expect(assigns[:profile_page]).to eq({user: user1})
        end
    end
end