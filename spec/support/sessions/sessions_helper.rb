module Helpers
	module SessionsHelper
		def sign_up_with(email, password, password_confirmation, f_name, l_name)
        fill_in 'Email', with: email
        fill_in 'Password', with: password
        fill_in 'Password confirmation', with: password_confirmation
        fill_in 'First name', with: f_name
        fill_in 'Last name', with: l_name
		end
		
		def signin(email, password)
		  fill_in 'Email', with: email 
		  fill_in 'Password', with: password
		end 
		
		

	end
end
