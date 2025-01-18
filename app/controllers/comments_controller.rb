class CommentsController < ApplicationController
  def new
    @post = Post.find(params[:post_id])
    @comment = @post.comments.new
    respond_to do |format|
      format.html { render :new,locals: {comment: @comment} }
    end
  end

  def  create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.new(comment_params)
    @comment.user = current_user
    respond_to do |format|
      format.html do
        if @comment.save
          flash[:notice] = 'Comment created succesfully!'
          redirect_to user_post_path(current_user,@post)
        else
          render :new,locals: {comment: @comment}
        end
      end
    end 
  end
  private

  def comment_params
    params.require(:comment).permit(:text)
  end
  
end
