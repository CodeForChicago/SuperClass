require "pry"

class LessonsController < ApplicationController
	def index
		@lessons = Lesson.all
	end
	
	def show # show has an implicit id argument (and probably other arguments too)
		# Used the below format for getting the correct lesson
		# @lesson = Lesson.find(id_num)
		
		# Here's the actual code for doing so; it's ugly, but it passes our tests thus far
		@lesson = Lesson.find(params[:id])
	end
		
	def new
		
	end
	
	def create
		binding.pry
		@lesson = Lesson.new
		args = self.request.filtered_parameters
		# Lesson.create(author: "ben",title: "title",body: \
						# "this is the body", url: "google.com")
		Lesson.create(author: args['author'], title: args['title'],\
					body: args['body'], url: args['url'])
	end
end
