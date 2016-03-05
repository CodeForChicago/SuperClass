require 'faker'

FactoryGirl.define do
	factory :lesson do
		author Faker::Superhero.name
		title Faker::Book.title
		url Faker::Internet.url
		body Faker::Hipster.paragraph
	end

end
