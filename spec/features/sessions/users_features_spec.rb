RSpec.configure do |c|
	  c.include Helpers::SessionsHelper
end

# Feature: Sign in 
# As a user
# I want to sign in 
# So I can visit protected areas of the site

feature 'Sign in', :devise do
  
  #Scenario: User cannot sign in if not registered\
  scenario 'user cannot sign in if not registered' do
    visit new_user_session_path
    signin('stevo@fakemail.com', 'password123')
    click_button 'Log in'
    expect(page).to have_content I18n.t 'devise.failure.not_found_in_database', authentication_keys: 'email'
  end 
  
  #Scenario: User can sign in if registered
  scenario 'user can sign in if registered' do
    visit new_user_session_path
    user = FactoryGirl.create(:user)
    signin(user.email, user.password)
    # signin('livinglife@gmil.com', 'smdfreestyle')
    click_button 'Log in'
    expect(page).to have_content I18n.t "devise.sessions.signed_in"
  end 

  #Scenario: User cannot sign in if email/password combination incorrect 
  
end