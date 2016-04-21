require 'spec_helper'
require "pry"

feature "Feedback Page" do
	let!(:feedback1) {FactoryGirl.create(:feedback)}
	
		scenario "viewing feedback page" do
		visit lessons_path
		puts lessons_path
		expect(page).to have_content(feedback1.title)
		expect(page).to have_content(feedback1.title)
		expect(page).to have_content(feedback1.body)
		expect(page).to have_content(feedback1.body)
	end
	
end 