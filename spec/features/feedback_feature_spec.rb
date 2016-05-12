require 'spec_helper'
# require "pry"

feature "Feedback Page" do
	
	scenario "User omitted email" do
		visit feedback_path
		fill_in 'Name', with: 'wayne rooney'
		fill_in 'Message', with: 'manchester is red'
		expect{
		click_button 'Send message'
		}.to change{ActionMailer::Base.deliveries.count}.by(0)
		expect(page).to have_field('Name', with: 'wayne rooney')
		expect(page).to have_field('Message', with: 'manchester is red')
	end
		
	scenario "User omitted name" do
		visit feedback_path
		fill_in 'Email', with: 'manchesterisred@cfc.com'
		fill_in 'Message', with: 'manchester is red'
		expect{
		click_button 'Send message'
		}.to change{ActionMailer::Base.deliveries.count}.by(0)
		expect(page).to have_field('Email', with: 'manchesterisred@cfc.com')
		expect(page).to have_field('Message', with: 'manchester is red')
	end
	
	scenario "User omitted message" do
		visit feedback_path
		fill_in 'Name', with: 'wayne rooney'
		fill_in 'Email', with: 'manchesterisred@cfc.com'
		expect{
		click_button 'Send message'
		}.to change{ActionMailer::Base.deliveries.count}.by(0)
		expect(page).to have_field('Name', with: 'wayne rooney')
		# expect(page).to have_field('Email', with: 'manchesterisred@cfc.com')
	end

	scenario "user is not signed in" do
		visit feedback_path
		fill_in 'Email', with: 'manchesterisred@cfc.com'
		fill_in 'Name', with: 'wayne rooney'
		fill_in 'Message', with: 'manchester is red'
		expect{
		click_button 'Send message'
		}.to change{ActionMailer::Base.deliveries.count}.by(1)
		expect(page).to have_content 'We appreciate your feedback! We will review your
                            message and try to improve our website soon.'
	end

	scenario "user is signed in" do
		visit feedback_path
		#TODO: For test, make individual sign in
		fill_in 'Email', with: 'manchesterisred@cfc.com'
		fill_in 'Name', with: 'wayne rooney'
		fill_in 'Message', with: 'manchester is red'
		expect{
		click_button 'Send message'
		}.to change{ActionMailer::Base.deliveries.count}.by(1)
		expect(page).to have_content 'We appreciate your feedback! We will review your
                            message and try to improve our website soon.'
		#TODO: expect last message sender to be this user
	end

	#TODO: write test to ensure that email, name, and message fields are filled
	# scenario "User is required to fill all fields" do
	# 	visit feedback_path
	# 	fill_in 'Message', with: 'manchester is red'
	# end
end
