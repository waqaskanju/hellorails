class Comment < ApplicationRecord

  # A comment has some author.
  belongs_to :author, class_name: 'User'

  # Caomment belon to a post.
  belongs_to :post

  # Update the count of comment after new comment has beend added.
  def update_comments_counter
    post.comments_counter = post.comments.length
  end
end
