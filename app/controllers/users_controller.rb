class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @posts = @user.posts
  end

  def post
    @user = User.find(params[:id])
    @posts = @user.posts
    @comments = @user.comments
    @comments_count = @user.comments.count
    @likes_count = @user.likes.count
  end

  def detail
    @user = User.find(params[:id])
    @posts = @user.posts
    @comments = @user.comments
    @comments_count = @user.comments.count
    @likes_count = @user.likes.count
    @idp = params[:idp]
  end
end
