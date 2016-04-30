require "pry"

class FeedbackController < ApplicationController
  before_action :authenticate_user!, only: [:create]
  include Devise::Controllers::Helpers
  helper_method :current_user
  
  def new
    @feedback = Feedback.new
  end
  
  def create
      @feedback = Feedback.new(params[:feedback])
      binding.pry
      if current_user != nil
        binding.pry
      end 
        @feedback["user"] = user
      @feedback.request = request
      if @feedback.deliver
        flash.now[:notice] = 'We appreciate your feedback! We will review your
                              message and try to improve our website soon.'
      else
        flash.now[:error] = 'Cannot send message.'
        render :new
      end
  end 
end 