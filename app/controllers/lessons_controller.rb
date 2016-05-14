
# require "pry"

class LessonsController < ApplicationController
	def index
		@lessons = Lesson.all
	end

	def show # show has an implicit id argument
		@lesson = Lesson.find(params[:id])
	end
	
	# TODO: make a new and a create function

	def show 
		@lesson = Lesson.find(params[:id])
	end
end
