# Modle for user to get the data from database.
class User < ApplicationRecord

  # Author has many posts.
  has_many :posts, foreign_key: 'author_id'

  # Author has many comments.
  has_many :comments, foreign_key: 'author_id'

  # Author has many likes.
  has_many :likes, foreign_key: 'author_id'

  # A method that returns the 3 most recent posts for a given user.
  def show_last_three_posts
    posts.order('created_at DESC').limit(3)
  end
end
