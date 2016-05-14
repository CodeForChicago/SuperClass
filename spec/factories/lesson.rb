require 'faker'

FactoryGirl.define do
	sequence(:title) {|n| "Dummy Title #{n}"}  #Used to create unique title, author and url values for every time factorygirl.create is called
	sequence(:author) {|n| "Dummy Author #{n}"}
	sequence(:url) {|n| "Dummy url #{n}"}
	
	factory :lesson do
		author
		title
		url
		#author Faker::Superhero.name
		#title Faker::Book.title
		#url Faker::Internet.url
		body Faker::Hipster.paragraph
	end

end
