class PostsController < ApplicationController
  # This functino can find all users and show the post of
  # a particular user.
  def index
    # Find all users
    @users = User.all
    # Find the user whose id is given
    @user = User.find_by(id: params[:user_id])
    # find the posts of user whose id is given.
    @posts = Post.where(author: @user)
  end

  # this function can select all user
  # Select a specific user
  # Select a post and its comments.
  def show
    # Find all users.
    @users = User.all
    # Select a user based on user_Id.
    @user = User.find_by(id: params[:user_id])
    # Select a post based on Id
    @post = Post.find_by(id: params[:id])
    # Select Comments of a post.
    @comments = Comment.where(post: @post)
  end

  # Create new Post
  def new
    @post = Post.new
  end

  # Save the post
  def create

    # Selec the current author
    author = current_user

    # only title and text is allowed to enter
    post = Post.new(params.require(:post).permit(:title, :Text))
    post.author = author

    # Save the post and redirect.
    if post.save
      redirect_to user_url(author)
    else
      render :new, locals: { post: post }
    end
  end
end
