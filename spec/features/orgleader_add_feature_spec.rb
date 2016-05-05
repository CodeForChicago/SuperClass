# Feature: If user is orgleader then user can add student

feature 'Add Student', :devise do
  
  scenario 'if you are org leader then you can add student' do 
    visit new_student_path
    expect(current_user.org_leader?).to be_true
    click_button 'Add Student'
    #Discuss with Juan what we get when we select roles
    expect(page.status_code).to eq(200)
  end 
  
  scenario 'if you are not org leader then cant access page' do
    visit new_student_path
    #checking to see if current_user is an org leader
    expect(current_user.org_leader?).to be_false
    click_button 'Add Student'
    expect(page.status_code).to eq(404)
  end 
  
end 