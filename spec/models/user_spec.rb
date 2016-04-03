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

	it 'is invalid without a full name'

	it 'is invalid without a password' do
		expect(FactoryGirl.build(:user, password: nil)).to_not be_valid
	end

	it 'is invalid without a role'

	it 'has a default role of student'

	it 'can have an admin role'

end