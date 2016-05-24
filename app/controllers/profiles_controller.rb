class ProfilesController < ApplicationController
    def show
        @profile_page = {user: User.find(params[:id])}
    end
end