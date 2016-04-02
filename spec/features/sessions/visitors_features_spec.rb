feature 'Sign Up' do
    
    scenario 'visitor can sign up with valid email address and password' do
        visit new_user_registration_path
        fill_in 'Email', with: "datcfc@gmail.com"
        fill_in 'Password', with: "cfcrulez"
        fill_in 'Password confirmation', with: "cfcrulez"
        click_button 'Sign up'
        expect(page).to have_content(/.*devise.registrations.signed_up.*|.*devise.registrations.signed_up_but_unconfirmed.*/)
    end 
    
    scenario 'visitor cannot sign up without a valid email address'
    
    scenario 'visitor cannot sign up with a blank password'
    
    scenario 'visitor cannot sign up with a short password'
    
    scenario 'visitor cannot sign up with an invalid password confirmation' #Test for mismatch and no confirmation 


end