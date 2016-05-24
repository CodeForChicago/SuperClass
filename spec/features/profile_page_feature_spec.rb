require 'spec_helper'

feature "Profile Page" do
    let(:user) {FactoryGirl.create(:user)}
    scenario "viewing profile page" do
        #binding.pry
        visit profiles_path + '/' + user.id.to_s
        
        expect(page).to have_content(user.first_name)
        expect(page).to have_content(user.last_name)
        expect(page).to have_content(user.email)
    end
end