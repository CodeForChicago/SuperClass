require 'spec_helper'

describe RegistrationsController, type: :controller do
    
    describe 'POST / create' do
      it 'allows to create with correct parameters' do
          expect{
              post :create, {
                  sign_up: {
                      first_name: 'loveTo',
                      last_name: 'code',
                      email: 'cfc@forLife.com',
                      password: 'password',
                      password_confirmation: 'password',
                      role: :student,
                  }
              }
          }.to change{User.count}.by(1)
      end
    end
end