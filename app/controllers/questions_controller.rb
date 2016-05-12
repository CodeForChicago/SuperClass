class QuestionsController < ApplicationController
    def index
        @questions = Question.all
    end
    
    def show
        @question = Question.find(params[:id])
        @comments = @question.comments
    end
    
    def new
        @question = Question.new
    end
end