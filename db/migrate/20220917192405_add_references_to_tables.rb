# frozen_string_literal: true

# Add references for post comment and likes
class AddReferencesToTables < ActiveRecord::Migration[7.0]
  def change
    # For the post table.

    add_reference :posts, :user, foreign_key: true

    # For the comments table.

    add_reference :comments, :user, foreign_key: true
    add_reference :comments, :post, foreign_key: true

    # For the likes table.

    add_reference :likes, :user, foreign_key: true
    add_reference :likes, :post, foreign_key: true

    #  Because different in the given schema instead of
    # author , author_id id is given.

    rename_column :posts, :user_id, :author_id
    rename_column :likes, :user_id, :author_id
    rename_column :comments, :user_id, :author_id
  end
end
