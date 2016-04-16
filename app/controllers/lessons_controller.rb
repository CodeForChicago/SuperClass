class LessonsController < ApplicationController
	def index
		@lessons = Lesson.all
	end
	
	def show 
		@lesson = Lesson.find(params[:id])
	end
		
	def new
		
	end
	
	def create
		@lesson = Lesson.new
		args = self.request.filtered_parameters
		Lesson.create(author: args['author'], title: args['title'],
					body: args['body'], url: args['url'])
	end
end
