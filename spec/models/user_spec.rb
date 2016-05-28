require 'rails_helper'

describe User, type: :model do
	it 'has a factory' do
		expect(FactoryGirl.create(:user)).to be_valid
	end

	it 'is invalid without an "email"' do
		expect(FactoryGirl.build(:user, email: nil)).to_not be_valid
	end

	it 'has a unique email' do
		same_email = "cfcrockz@gmail.com"
		FactoryGirl.create(:user, email: same_email )
		expect(FactoryGirl.build(:user, email: same_email )).to_not be_valid
		expect(FactoryGirl.build(:user, email: same_email.upcase )).to_not be_valid
	end

	it 'is invalid without a first name' do
		expect(FactoryGirl.build(:user, first_name: nil)).to_not be_valid
	end

	it 'is invalid without a last name' do
		expect(FactoryGirl.build(:user, last_name: nil)).to_not be_valid
	end

	it 'is invalid without a password' do
		expect(FactoryGirl.build(:user, password: nil)).to_not be_valid
	end

	it 'has a default role of student' do 
		expect(FactoryGirl.create(:user, role: nil).student?).to be(true)
	end 

	it 'can have an admin role' do
		expect(FactoryGirl.build(:user, role: :admin)).to be_valid
	end

	it 'has many questions' do
		user1 = FactoryGirl.create(:user)
		question1 = FactoryGirl.create(:question, user: user1)
		expect(user1.questions).to match_array([question1])
	end
	it 'has a name' do
		user1 = FactoryGirl.create(:user, first_name:"Shelly", last_name:"Long")

		expect(user1.name).to eql(user1.first_name + " " + user1.last_name)
	end 
end
