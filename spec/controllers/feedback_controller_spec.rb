
require "spec_helper"

feature "feedback_page" do
    scenario "user sends feedback" do
        visit "/feedback"
    end
end

