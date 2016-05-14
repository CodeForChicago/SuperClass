class QuestionsController < ApplicationController
    # Authenticates user before :new and :create, redirects to sign-in path
    before_action :authenticate_user!, only: [:new, :create]
    
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
    
    def create
        @question = Question.new(params[:question])
        redirect_to questions_path
    end
end