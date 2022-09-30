class CommentsController < ApplicationController
  # Before adding comment authenticate user
  before_action :authenticate_user!

  # To show all Comments
  def index
    @comments = Comment.all
  end

  # TO create New comment
  def new
    @comment = Comment.new
  end

  # To save new comment.
  def create
    @comment = Comment.new(comment_params)
    @comment.id = rand(1..2000)
    @comment.author = current_user
    @comment.post = Post.find(1)
    @author = User.find(1)

    if @comment.save
      flash[:success] = 'New Comment added!'
      redirect_to comments_path
    else
      flash[:error] = 'Error! Try again.'
      render :new
    end
  end

  private

  # only these attributes are allowed to change.
  def comment_params
    params.require(:comment).permit(:text, :author_id, :post_id)
  end
end
