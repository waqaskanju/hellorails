# Link Library
require 'rails_helper'

# Test Post show method.
RSpec.describe 'Posts show', type: :feature do
  # First add data.
  before(:each) do
    # Select user
    @user = User.find_by(id: 1)
    # Select Post
    @post = Post.find_by(id: 1)

    # Select Comment
    @comment = Comment.find_by(id: 3)

    # Select Commenter
    @commentor = User.find_by(id: @comment.author_id)
    visit user_post_path(@user, @post)
  end

  # Test 1 Show Post info
  scenario 'Test Post information' do
    expect(page).to have_content(@post.Title)
    expect(page).to have_content(@user.Name)
    expect(page).to have_content(@post.Text)
    expect(page).to have_content("Comments: #{@post.CommentsCounter}")
    expect(page).to have_content("Likes: #{@post.LikesCounter}")
  end

  # Test the person writer of comment.
  scenario 'See commentator info' do
    expect(page).to have_content(@commentor.name)
    expect(page).to have_content(@comment.text)
  end
end
