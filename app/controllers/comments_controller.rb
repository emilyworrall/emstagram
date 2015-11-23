class CommentsController < ApplicationController

  def new
    @post = Post.find(params[:post_id])
    @comment = Comment.new
  end

  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.create(comment_params)
    if @comment.save
      @comment.user_id = current_user.id
      @comment.username = current_user.username
      @comment.save
      redirect_to post_path(@post)
    else
      render 'new'
    end
  end

  def destroy
    @comment = Comment.find(params[:post_id])
    @comment.destroy
    flash[:notice] = 'Comment deleted successfully'
    redirect_to '/posts'
  end

  private

  def comment_params
    params.require(:comment).permit(:thoughts)
  end

end
