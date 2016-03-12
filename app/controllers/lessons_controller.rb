class LessonsController < ApplicationController
	def index
		@lessons = Lesson.all
	end
	
	def show	
		@lesson = Lesson.first
	end
end
