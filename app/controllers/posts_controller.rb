class PostsController < ApplicationController
    def index
       @user = User.find(params[:user_id])
       @posts = @user.posts.includes(:comments, :user)
    end
    def show
        @user_post = User.find(params[:user_id])
        @posts = @user_post.posts.includes(:comments)
        @post = @posts.find(params[:id])
    end
end
