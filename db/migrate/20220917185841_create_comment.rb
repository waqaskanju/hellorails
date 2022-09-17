# frozen_string_literal: true

# Create Table for Comment to add user comment.
class CreateComment < ActiveRecord::Migration[7.0]
  def change
    create_table :comments do |t|
      t.text :Text

      t.timestamps
    end
  end
end
