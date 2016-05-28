require 'faker'

FactoryGirl.define do
	factory :feedback do
		name Faker::Superhero.name
		email Faker::Internet.email
		#message Faker::Hipster.paragraph
	end

end
