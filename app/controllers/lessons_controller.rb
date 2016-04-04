require "pry"

class LessonsController < ApplicationController
	def index
		@lessons = Lesson.all
	end
	
	def show # show has an implicit id argument (and probably other arguments too)
		# @lesson = Lesson.first # This will likely need to be changed to 
		# binding.pry
		
		# Used the below format for getting the correct lesson
		# @lesson = Lesson.find(:id)
		
		# Here's the actual code for doing so; it's ugly, but it passes our tests thus far
		@lesson = Lesson.find(self.request.filtered_parameters["id"])
	end
		
	def new
		
	end
	
	def create

	end
end
