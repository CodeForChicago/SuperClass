describe FeedbackController, type: :controller do
    describe 'GET / new' do
        it 'return an http success' do
            get :new
            expect(response).to be_success
        end
        
        it 'returns a form' do
            get :new
            expect(assigns[:feedback]).to be_a(Feedback)
        end
    end
    
    describe 'POST / create' do
        it 'sends a new feedback' do
            expect{
                post :create, {
                    feedback: {
                        name: 'wayne rooney',
                        email: 'manchesterisred@cfc.com',
                        message: 'manchesterisred',
                    }
                }
            }.to change{ActionMailer::Base.deliveries.count}.by(1)
        end
    end
end