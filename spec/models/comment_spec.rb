require 'rails_helper'

describe Comment, type: :model do
    it 'has a factory' do
        expect(FactoryGirl.create(:comment)).to be_valid
    end
    
    it 'is invalid without a user' do
        expect(FactoryGirl.build(:comment, user: nil)).to_not be_valid
    end
    
    it 'is invalid without a body' do
        expect(FactoryGirl.build(:comment, body: nil)).to_not be_valid
        expect(FactoryGirl.build(:comment, body: '')).to_not be_valid
    end
    
    it 'is invalid without a question' do
        expect(FactoryGirl.build(:comment, question: nil)).to_not be_valid
    end
end
