# Add comment to post.
class Comment < ApplicationRecord
  # A comment has some author.
  belongs_to :author, class_name: 'User', foreign_key: :author_id

  # Caomment belon to a post.
  belongs_to :post

  # update the count for comment.
  after_save :update_comments_count

  # Update the count of comment after new comment has beend added.
  def update_comments_count()
    p1 = Post.find(1)
    p1.CommentsCounter = p1.CommentsCounter + 1
  end
end

# For testing use this script.

#  Comment.create(post_id: 1, Author: second_user, Text: 'Hi Tom!' )
