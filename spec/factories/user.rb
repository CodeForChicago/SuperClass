require 'faker'

FactoryGirl.define do
	sequence :email do |n|
		"email#{n}@factory.com"
	end

	factory :user do
		email
		password Faker::Internet.password(8)
		first_name Faker::Name.first_name
		last_name Faker::Name.last_name
		role :student
	end
end
