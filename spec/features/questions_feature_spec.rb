require 'spec_helper'

feature "Questions Page", :focus do
    let!(:question1) {FactoryGirl.create(:question)}
    let!(:question2) {FactoryGirl.create(:question)}
    let(:user1) {FactoryGirl.create(:user, email: 'stevo@fakem.com', password: 'password123')}
    let(:user2) {FactoryGirl.create(:user, first_name: 'Diego', last_name: 'lopez',role: 'student', email: 'thisisit@gmail.com', password: 'password456')}
    
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
    
    scenario "viewing question page" do
        FactoryGirl.create(:comment, question: question1)
        FactoryGirl.create(:comment, question: question1)
        
        visit "questions/#{question1.id}"
        
        expect(page).to have_content(question1.title)
        expect(page).to have_content(question1.body)
        expect(page).to have_content(question1.user.first_name)
        expect(page).to have_content(question1.user.last_name)
        
        for comment in question1.comments
            expect(page).to have_content(comment.body)
            expect(page).to have_content(comment.user.first_name)
            expect(page).to have_content(comment.user.last_name)
        end
    end
    
    scenario "making a new question" do
        
        # log in
        visit new_user_session_path
        signin(user2.email, 'password456')
        click_button 'Log in'
        
        # make a question
        title = 'Post a new question'
        body = 'This is how you post a new question'
        
        visit new_question_path
        fill_in 'Title', with: title
        fill_in 'Body', with: body
        click_button 'Post Question'
        
        expect(page).to have_content(title)
        expect(page).to have_content(body)
    end
end