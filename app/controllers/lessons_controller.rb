class LessonsController < ApplicationController
	def index
		@lessons = Lesson.all
	end
	
	def show
		head :ok
	end
end
