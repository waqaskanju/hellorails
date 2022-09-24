class UsersController < ApplicationController
  # Find all users.
  def index
    @users = User.all
  end

  # Select a person
  # select post of a person
  # Show recent post.
  def show
    @user = User.find(params[:id])
    @posts = @user.posts
    @recent_posts = @user.recent_posts
    @count = @user.posts.count
  end

  # show all post of a single user.

  def post
    @user = User.find(params[:id])
    @posts = @user.posts
    @posts_count = @user.posts.count
    @comments = @user.comments
    @comments_count = @user.comments.count
    @likes_count = @user.likes.count
  end

  # show the detaili of single post
  def detail
    @user = User.find(params[:id])
    @posts = @user.posts
    @comments = @user.comments
    @comments_count = @user.comments.count
    @likes_count = @user.likes.count
    @idp = params[:idp]
  end
end
