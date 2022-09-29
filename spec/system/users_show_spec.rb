# Link library
require 'rails_helper'

# Test User Show FUnctionality.

# Run this before any test. to get data.
RSpec.describe 'In the users show page', type: :system do
  before(:each) do
    # Select user 1.
    @user1 = User.find_by(id: 1)
    # Select post 1
    @post1 = Post.find_by(id: 1)
  end

  # is there picture/ name / bio/ and number of posts
  scenario 'Check  picture,name, bio and post count' do
    # Visit this URL
    visit user_path(@user1)

    # Testing Picture.
    expect(page).to have_xpath("//img[@src='#{@user1.photo}']")
    # Testing Name
    expect(page).to have_text(@user1.name)
    # Testing Bio.
    expect(page).to have_text(@user1.bio)
    # Testing Post Count
    expect(page).to have_text(/posts: #{@user1.PostCount}/i)
  end

  # Check Post Title and Text
  scenario 'Test posts Title and Text' do
    # Visit this URL
    visit user_path(@user1)
    # Show Recent Posts.
    @user1.show_recent_posts.each do |post|
      # Test Title
      expect(page).to have_content(post.Title)
      # Test Text
      expect(page).to have_content(post.Text)
    end
  end

  scenario 'Test  title and text' do
    visit user_path(@user1)
    expect(page).to have_link('See all posts')
  end

  scenario 'Vist index page' do
    visit user_path(@user1)
    click_link 'See all post'
    expect(page).to have_current_path(user_posts_path(@user1))
  end

  scenario 'Visit show page' do
    visit user_path(@user1)
    click_on(@post1.Title)
    expect(current_path).to eq("/users/#{@user1.id}/posts/20")
  end
end
