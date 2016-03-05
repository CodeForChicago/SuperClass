require 'spec_helper'

feature "Lessons Page" do
	let!(:lesson1) {FactoryGirl.create(:lesson)}
	let!(:lesson2) {FactoryGirl.create(:lesson)}

	scenario "viewing lessons page" do
		visit lessons_path
		expect(page).to have_content(lesson1.title)
		expect(page).to have_content(lesson2.title)
		expect(page).to have_content(lesson1.body)
		expect(page).to have_content(lesson2.body)
	end

end
