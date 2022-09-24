# Modle for user to get the data from database.
class User < ApplicationRecord
  # validate Name so that it is not blank.
  validates :name, presence: true

  # It can only be integer greate or equal to zero.
  validates :postscounter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  # Author has many posts.
  has_many :posts, foreign_key: 'author_id', dependent: :destroy

  # Author has many comments.
  has_many :comments, foreign_key: 'author_id', dependent: :destroy

  # Author has many likes.
  has_many :likes, foreign_key: 'author_id', dependent: :destroy

  # A method that returns the 3 most recent posts for a given user.
  def recent_posts(num = 3)
    posts.includes(:author).order(created_at: :desc).limit(num)
  end
end

# For testing this file add the data.

# first_user = User.create(name: 'Tom',
# photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico.')
# second_user = User.create(name: 'Lilly',
# photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Poland.')

# p.first_user
# p.second_user
