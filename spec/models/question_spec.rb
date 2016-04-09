require 'rails_helper'

describe Question, type: :model do
    it 'has a factory' do
        expect(FactoryGirl.create(:question)).to be_valid
    end
    
    it 'is invalid without a user' do
        expect(FactoryGirl.build(:question, user: nil)).to_not be_valid
    end
    
    it 'is invalid without a body' do
        expect(FactoryGirl.build(:question, body: nil)).not_to be_valid
        expect(FactoryGirl.build(:question, body: '')).to_not be_valid
    end
    
    it 'is invalid without a title' do
        expect(FactoryGirl.build(:question, title: nil)).to_not be_valid
        expect(FactoryGirl.build(:question, title: '')).to_not be_valid
    end
    
    it 'is invalid with a too long title' do
        expect(FactoryGirl.build(:question, title: 'i' * 500)).to_not be_valid
        expect(FactoryGirl.build(:question, title: 'i' * 128)).to be_valid
    end
end