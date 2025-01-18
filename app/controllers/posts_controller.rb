class PostsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @posts = @user.posts.includes(:comments, :user)
  end
  def new
    @post = current_user.posts.new
    respond_to do |format|
      format.html { render :new,locals: {post: @post} }
    end
  end
  def create
    @post = current_user.posts.new(post_params)
    respond_to do |format|
      format.html do 
        if @post.save
          flash[:notice] = 'Post created succesfully!'
          redirect_to user_posts_path(current_user)
        else
          render :new,locals: {post: @post}
        end
      end
    end
    end

  def show
    @user_post = User.find(params[:user_id])
    @posts = @user_post.posts.includes(:comments)
    @post = @posts.find(params[:id])
  end
  private
  def post_params
      params.require(:post).permit(:title, :text)
  end
end

