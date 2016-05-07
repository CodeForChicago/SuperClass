require "pry"

class FeedbackController < ApplicationController
 # before_action :authenticate_user!, only: [:create]
  
  include Devise::Controllers::Helpers
  helper_method :current_user
  
  def new
    @feedback = Feedback.new
  end
  
  def create
      @feedback = Feedback.new(params[:feedback])
      #TODO: make the view render the appropriate fields (i.e.: only display
      # email and name fields for not signed-in users) and then the controller
      # can check to see if the fields are there or not, and if not, fill in the 
      # user's info, without exposing it to the world in the HTML of the view page
      if current_user != nil
      end 
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