require 'spec_helper'
# require 'pry'

# Feature: If user is orgleader then user can add student

feature 'Add Student', :devise do
  
  f_name = "Codeniferous"
	l_name = "Chicageous"
	password = "cfcrulez"
	email = "datcfc@gmail.com"
	role = nil
	
	student_f_name = "awesome"
	student_l_name = "pants"
	student_password = "password"
	student_email = "cfcstudent@gmail.com"
	student_role = nil
    
  # see spec/features/visitors_features_spec.rb for how to create a user both
  # with and without a orgleader role
  # we should be able to create the user, then access it from the session
  # store with User.method
  scenario 'if you are org leader then you can add student' do 
    binding.pry
    visit new_user_registration_path
		sign_up_with(email, password, password, f_name, l_name, 'Organization Leader')
 		click_button 'Sign up'
    #if ((User.first.role) is 'Organization Leader')
    if (expect(User.where(email: email).first.role).to eq("org_leader"))
      #visit new_student_path
      click_button 'Add Student'
      sign_up_with(student_email, student_password, student_password, student_f_name,
                   student_l_name, 'Student')
      click_button 'Create Student' # make sure this matches the button's text
      expect(User.where(email: student_email).first.email).to eq(student_email)
    end 
    #Discuss with Juan what we get when we select roles
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