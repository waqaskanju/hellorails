# frozen_string_literal: true

# Create Table for Like
class CreateLike < ActiveRecord::Migration[7.0]
  def change
    create_table :likes, &:timestamps
  end
end
