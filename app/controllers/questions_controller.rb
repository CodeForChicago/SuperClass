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
        @question = Question.new(question_params)
        # binding.pry
        @question.user = create_user
        @question.save!
        redirect_to questions_path
    end
    
private
    def question_params
        in_params = params.require(:question)
        in_params.permit(:title, :body)
    end
    
    def create_user
        in_params = params.require(:question)
        user_id = in_params[:user].to_i
        User.find(user_id)
    end
end