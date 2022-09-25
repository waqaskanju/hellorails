class LikesController < ApplicationController
  # For creating new LIke
  def create
    post = Post.find(params[:post_id])
    # selecting the current user with id 1
    author = current_user
    like = Like.new(params.permit(:author, :post))
    # assigning author
    like.author = author
    # assigning post
    like.post = post

    if like.save
      flash[:success] = 'Post liked :)'
      redirect_to likes_path(post[:author_id], post)
    else
      flash.now[:error] = 'Some thing is wrong ):'
    end
  end
end
