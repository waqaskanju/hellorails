class Post < ApplicationRecord
  # A post belongs to an author.
  belongs_to :author, class_name: 'User'

  #  A post have many comments.
  has_many :comments

  # A post have many likes.
  has_many :likes

  # call the method update_post_count to increment the posts.
  after_save :update_posts_count


  # show last five comments.
  def show_last_five_comments
    comments.order('created_at DESC').limit(5)
  end

  # Update number of post when new posts are added.
  def update_posts_counter
    user.posts_counter = user.posts.length
  end
end
