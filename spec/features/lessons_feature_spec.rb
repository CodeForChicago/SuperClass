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

	scenario "viewing lesson page" do
		#TODO: test following happens
		#it 'shows a body for the lesson'

		#it 'shows the creator of the lesson'

		#it 'links individual to correct lesson url'
	end

	scenario "new lesson page" do
		#TODO: test following occur
		#admin has form to fill for new test
		#error msg if not everything is filled in
		#success msg if the lesson goes through
		#stays on same form after submit (cleared)
	end
		

end
