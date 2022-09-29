# include rail help library
require 'rails_helper'

# Describe that Comment is a type of model
# Create a new object of user class
RSpec.describe Comment, type: :model do
  user1 = User.create(name: 'Waqas',
                      photo: 'http://www.abc.com',
                      bio: 'This is the story of a person',
                      postscounter: 0)

  # create a new comment
  subject do
    post1 = Post.create(
      author_id: user1,
      Title: 'First Post',
      Text: 'An Amazing story',
      CommentsCounter: 2,
      LikesCounter: 5
    )
    Comment.create(author_id: user1.id,
                   Text: 'This is comment text',
                   post_id: post1.id)
  end

  # First test:  text should not be empty

  it 'Comment should not be empty' do
    subject.Text = ''
    expect(subject).to_not be_valid
  end

  # Seond test when count_upate method is called is should update the count.
  it 'Update comments counter method' do
    expect(subject.update_comments_count).to eq(4)
  end
end
