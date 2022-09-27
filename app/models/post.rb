class Post < ApplicationRecord
  # validate Title so that it is not blank.
  validates :Title, presence: true, length: { maximum: 500 }

  # Comments counter >0
  validates :CommentsCounter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  # Likes counter > 0
  validates :LikesCounter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  # A post belongs to an author.
  belongs_to :user, class_name: 'User', foreign_key: :author_id

  #  A post have many comments.
  has_many :comments, dependent: :destroy

  # A post have many likes.
  has_many :likes, dependent: :destroy

  # call the method update_post_count to increment the posts.
  after_save :update_posts_count

  # show last five comments.
  def recent_comments(num = 5)
    comments.includes(:post).order(created_at: :desc).limit(num)
  end

  # Update number of post when new posts are added.
  def update_posts_count
    user.increment!(:postscounter)
  end
end

# For testing use this script.

# first_post = Post.create(author_id: 1, Title: 'Hello', Text: 'This is my first post')
# p first_post
