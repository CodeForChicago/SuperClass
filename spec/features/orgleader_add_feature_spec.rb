require 'spec_helper'
# require 'pry'

# Feature: If user is orgleader then user can add student

feature 'Add Student', :devise do
  
  # see spec/features/visitors_features_spec.rb for how to create a user both
  # with and without a orgleader role
  # we should be able to create the user, then access it from the session
  # store with User.method
  scenario 'if you are org leader then you can add student' do 
    visit new_student_path
    # binding.pry
    expect(current_user.org_leader?).to be_true
    click_button 'Add Student'
    #Discuss with Juan what we get when we select roles
    expect(page.status_code).to eq(200)
  end 
  
  scenario 'if you are not org leader then cant access page' do
    visit new_student_path
    # binding.pry
    #checking to see if current_user is an org leader
    expect(current_user.org_leader?).to be_false
    click_button 'Add Student'
    expect(page.status_code).to eq(404)
  end 
  
end 