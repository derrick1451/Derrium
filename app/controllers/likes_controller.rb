class LikesController < ApplicationController
    def create
        @user = current_user
        @post = Post.find(params[:post_id])
        @like = @post.likes.new(user: @user)
        if @like.save
            flash[:notice] = 'Like created succesfully!'
            redirect_to user_post_path(@user,@post)
        else
            render :new,locals: {like: @like}
        end
    end

end
