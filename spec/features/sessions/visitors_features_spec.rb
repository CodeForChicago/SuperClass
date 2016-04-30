RSpec.configure do |c|
	  c.include Helpers::SessionsHelper
end

feature 'Sign Up' do
	f_name = "Codeniferous"
	l_name = "Chicageous"
	password = "cfcrulez"
	email = "datcfc@gmail.com"
	role = nil
    
    scenario 'visitor can sign up correctly as default student' do
        visit new_user_registration_path
		sign_up_with(email, password, password, f_name, l_name, role)
 		click_button 'Sign up'
 		txts = [I18n.t( 'devise.registrations.signed_up'), I18n.t( 'devise.registrations.signed_up_but_unconfirmed')]
  		expect(page).to have_content(/.*#{txts[0]}.*|.*#{txts[1]}.*/)
  		expect(User.where(email: email).first.role).to eq("student")
    end
    
    scenario 'visitor can sign up correctly as a organization leader' do
        visit new_user_registration_path
				sign_up_with(email, password, password, f_name, l_name, 'Organization Leader')
 				click_button 'Sign up'
 				txts = [I18n.t( 'devise.registrations.signed_up'), I18n.t( 'devise.registrations.signed_up_but_unconfirmed')]
  			expect(page).to have_content(/.*#{txts[0]}.*|.*#{txts[1]}.*/)
  			expect(User.where(email: email).first.role).to eq("org_leader")
    end
    
    scenario 'visitor cannot sign up without a valid email address' do
      visit new_user_registration_path
			sign_up_with("bogus", password, password, f_name, l_name, role)
 			click_button 'Sign up'
			expect(page).to have_content 'Email is invalid'
		end
    
    scenario 'visitor cannot sign up with a blank password' do
      visit new_user_registration_path
			sign_up_with("bogus", '', '', f_name, l_name, role)
 			click_button 'Sign up'
			expect(page).to have_content "Password can't be blank"
		end
    
    scenario 'visitor cannot sign up with a short password' do
      visit new_user_registration_path
			sign_up_with(email, 'bruh', 'bruh', f_name, l_name, role)
 			click_button 'Sign up'
			expect(page).to have_content "Password is too short"
		end
    
    scenario 'visitor cannot sign up with an invalid password confirmation' do #Test for mismatch and no confirmation 
      visit new_user_registration_path
			sign_up_with(email, password, 'bruh', f_name, l_name, role)
 			click_button 'Sign up'
			expect(page).to have_content "Password confirmation doesn't match"
		end

end
