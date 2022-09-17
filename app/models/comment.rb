# Add comment to post.
class Comment < ApplicationRecord

  # A comment has some author.
  belongs_to :author, class_name: 'User'

  # Caomment belon to a post.
  belongs_to :post

  # update the count for comment.
  after_save :update_comments_count

  # Update the count of comment after new comment has beend added.
  def update_comments_count
    post.increment!(:comments_counter)
  end
end
