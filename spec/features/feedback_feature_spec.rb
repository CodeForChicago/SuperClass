require 'spec_helper'
require "pry"

feature "Feedback Page" do
	
	scenario "user is not signed in" do
		visit feedback_path
		fill_in 'Email', with: 'manchesterisred@cfc.com'
		fill_in 'Name', with: 'wayne rooney'
		fill_in 'Feedback', with: 'manchester is red'
		click_button 'Send message'
		expect(page).to have_content 'We appreciate your feedback!'
	end
	
end 