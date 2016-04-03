require "pry"

class LessonsController < ApplicationController
	def index
		@lessons = Lesson.all
	end
	
	def show # show has an implicit id argument (and probably other arguments too)
		# @lesson = Lesson.first # This will likely need to be changed to 
		binding.pry
		@lesson = Lesson[id]
	end
		
	def new
		
	end
	
	def create

	end
end
