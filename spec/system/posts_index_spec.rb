# Link Library.
require 'rails_helper'

# Checking index function.
RSpec.describe ' Test index Function in Post', type: :feature do
  scenario 'Check user info' do
    # Test 1
    expect(page).to have_content(@user.name)

    # Test 2
    expect(page).to have_xpath("//img[@src='#{@user.photo}']")

    # Test 3
    expect(page).to have_content(@user.PostsCounter.to_s)
  end

  # Is Post Title Shown.

  scenario 'Post Title Check' do
    expect(page).to have_content(@post.Title)
  end

  # Does post has Test

  scenario 'post contain Test attribute' do
    expect(page).to have_content(@post.Text)
  end

  # Check first Comment

  scenario 'Show first Comment' do
    comments = @post.comments
    comments.each do |comment|
      expect(page).to have_content(comment.text)
    end
  end

  # Count the number of posts

  scenario 'Displays the number of comments in a post' do
    expect(page).to have_content(@post.CommentsCounter)
  end

  # Show the number of likes on post.

  scenario 'Show Likes' do
    expect(page).to have_content(@post.LikesCounter)
  end

  # Go to a particular post of a user.

  scenario 'Like to post' do
    visit user_post_path(@user, @post)
    expect(current_path).to eq("/users/#{@user.id}/posts/#{@post.id}")
  end
end
