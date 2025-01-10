class UsersController < ApplicationController
    def index
        @users = User.all
    end
    def show
        @user = User.find(params[:id])
        if @user.nil?
            flash[:alert] = 'User not found'
            redirect_to users_path
        end
    end
end