require 'spec_helper'

feature "Questions Page" do
    let!(:question1) {FactoryGirl.create(:question)}
    let!(:question2) {FactoryGirl.create(:question)}
    
    scenario "viewing questions page" do
        visit questions_path
        expect(page).to have_content(question1.title)
        expect(page).to have_content(question1.body)
        expect(page).to have_content(question1.user.first_name)
        expect(page).to have_content(question1.user.last_name)
        expect(page).to have_content(question2.title)
        expect(page).to have_content(question2.body)
        expect(page).to have_content(question2.user.first_name)
        expect(page).to have_content(question2.user.last_name)
    end
end