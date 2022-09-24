class Like < ApplicationRecord
  # Like belong to  user/Author
  belongs_to :author, class_name: 'User', foreign_key: :author_id

  # Post has some like.
  belongs_to :post

  # After like are posted. update the count.
  after_save :update_likes_count

  # Update the count of liked posts.

  def update_likes_count
    post.increment!(:likes_counter)
  end
end
