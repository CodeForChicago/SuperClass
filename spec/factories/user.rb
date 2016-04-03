require 'faker'

FactoryGirl.define do
	sequence :email do |n|
		"email#{n}@factory.com"
	end

	factory :user do
		email
		password Faker::Internet.password(8)
	end
end
