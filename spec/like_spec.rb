
# Add help class for spec.
require 'rails_helper'

# Assert that Like is a model
RSpec.describe Like, type: :model do

  # create a new user
  user1 = User.create(name: 'Waqas', 
    photo: 'abc.com',
     bio: 'The bio text',
      posts_counter: 0)

  
  # Create a 2nd user.
      user2 = User.create(name: 'Ahamd',
     photo: 'def com', 
     bio: 'some bio text',
      posts_counter: 0)

  # create a post
      post = Post.create(author: user1,
    title: 'post title',
    text: 'Show me the ittle',
    comments_counter: 0,
    likes_counter: 0)


  # First test  update the count method.
  subject { Like.create(post:, author: user2) }
  it 'Update likes counter' do
    expect(subject.send(:update_likes_count)).to eq(true)
  end
end
