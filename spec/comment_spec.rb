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
    Comment.create(
      post: Post.create(
        author: user1,
        Title: 'First Post',
        Text: 'An Amazing story',
        CommentsCounter: 2,
        LikesCounter: 5
      ),
      author: user1,
      text: 'This is comment text'
    )
  end

  # First test:  text should not be empty

  it 'Comment should not be empty' do
    subject.text = ''
    expect(subject).to_not be_valid
  end

  # Seond test when count_upate method is called is should update the count.
  it 'Update comments counter method' do
    expect(subject.update_comments_count).to eq(3)
  end
end
