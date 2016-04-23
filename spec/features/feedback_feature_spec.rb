require 'spec_helper'
require "pry"

feature "Feedback Page" do
	
	scenario "viewing feedback page" do
		visit feedback_path
	end
	
end 