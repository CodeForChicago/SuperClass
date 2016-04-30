module Helpers
	module SessionsHelper
		def sign_up_with(email, password, password_confirmation, f_name, l_name, role = nil)
        fill_in 'Email', with: email
        fill_in 'Password', with: password
        fill_in 'Password confirmation', with: password_confirmation
        fill_in 'Last name', with: l_name
        fill_in 'First name', with: f_name
        if role then select role, from: 'Role' end
		end
		
		def signin(email, password)
		  fill_in 'Email', with: email 
		  fill_in 'Password', with: password
		end 

	end
end
