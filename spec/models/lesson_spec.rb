require 'rails_helper'

RSpec.describe Lesson, type: :model do
	it 'has a factory' do
		expect(FactoryGirl.create(:lesson)).to be_valid
	end

	it 'is invalid without a "author"' do
		expect(FactoryGirl.build(:lesson, author: nil)).to_not be_valid
		expect(FactoryGirl.build(:lesson, author: '')).to_not be_valid
	end

	it 'is invalid without a body' do
		expect(FactoryGirl.build(:lesson, body: nil)).to_not be_valid
		expect(FactoryGirl.build(:lesson, body: '')).to_not be_valid
	end

	it 'is invalid without a url' do
		expect(FactoryGirl.build(:lesson, url: nil)).to_not be_valid
		expect(FactoryGirl.build(:lesson, url: '')).to_not be_valid
	end
		

	it 'is invalid without a title' do
		expect(FactoryGirl.build(:lesson, title: nil)).to_not be_valid
		expect(FactoryGirl.build(:lesson, title: '')).to_not be_valid
	end

	it 'is invalid with repeat urls'

	it 'is invalid with repeat title+creator'

	it 'does not allow to submit a lesson unless all fields are not null'

	it 'returns descriptive error messages'
end
