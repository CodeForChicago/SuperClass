require 'spec_helper'
require "pry"

feature "Lessons Page" do
	let!(:lesson1) {FactoryGirl.create(:lesson)} #, url: "firsturl")}
	let!(:lesson2) {FactoryGirl.create(:lesson)} #, url: "securl")}

	scenario "viewing lessons page" do
		visit lessons_path
		puts lessons_path
		expect(page).to have_content(lesson1.title)
		expect(page).to have_content(lesson2.title)
		expect(page).to have_content(lesson1.body)
		expect(page).to have_content(lesson2.body)
	end

	scenario "viewing lesson page" do
		visit "lessons/#{lesson1.id}"
		puts  "lessons/#{lesson1.id}"
		expect(page).to have_content(lesson1.title)
		expect(page).to have_content(lesson1.body)
		expect(page).to have_content(lesson1.author)
		expect(page).to have_content(lesson1.url)
		# expect(page).to have_content(lesson1.updated_at)
		expect(page).to have_content("Take me there!")
	end

	scenario "new lesson page" do
		#TODO: test following occur
		#admin has form to fill for new test
		#error msg if not everything is filled in
		#success msg if the lesson goes through
		#stays on same form after submit (cleared)
	end
end
