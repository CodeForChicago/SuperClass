RSpec.configure do |c|
	  c.include Helpers::SessionsHelper
end

feature 'Sign Up' do
	f_name = "Codeniferous"
	l_name = "Chicageous"
	password = "cfcrulez"
	email = "datcfc@gmail.com"
    
    scenario 'visitor can sign up with valid email address and password' do
        visit new_user_registration_path
				sign_up_with(email, password, password, f_name, l_name)
 				click_button 'Sign up'
        expect(page).to have_content(/.*devise.registrations.signed_up.*|.*devise.registrations.signed_up_but_unconfirmed.*/)
    end 
    
    scenario 'visitor cannot sign up without a valid email address' do
      visit new_user_registration_path
			sign_up_with("bogus", password, password, f_name, l_name)
 			click_button 'Sign up'
			expect(page).to have_content 'Email is invalid'
		end
    
    scenario 'visitor cannot sign up with a blank password' do
      visit new_user_registration_path
			sign_up_with("bogus", '', '', f_name, l_name)
 			click_button 'Sign up'
			expect(page).to have_content "Password can't be blank"
		end
    
    scenario 'visitor cannot sign up with a short password' do
      visit new_user_registration_path
			sign_up_with(email, 'bruh', 'bruh', f_name, l_name)
 			click_button 'Sign up'
			expect(page).to have_content "Password is too short"
		end	
    
    scenario 'visitor cannot sign up with an invalid password confirmation' do #Test for mismatch and no confirmation 
      visit new_user_registration_path
			sign_up_with(email, password, 'bruh', f_name, l_name)
 			click_button 'Sign up'
			expect(page).to have_content "Password confirmation doesn't match"
		end

end
