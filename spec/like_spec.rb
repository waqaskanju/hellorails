# Add help class for spec.
require 'rails_helper'

# Assert that Like is a model
RSpec.describe Like, type: :model do
  # create a new user
  user1 = User.create(name: 'Waqas',
                      photo: 'abc.com',
                      bio: 'The bio text',
                      postscounter: 0)

  # Create a 2nd user.
  user2 = User.create(name: 'Ahamd',
                      photo: 'def com',
                      bio: 'some bio text',
                      postscounter: 0)

  # create a post
  post = Post.create(author_id: user1.id,
                     Title: 'post title',
                     Text: 'Show me the ittle',
                     CommentsCounter: 0,
                     LikesCounter: 0)

  # First test  update the count method.
  subject { Like.create(id: rand(1..1000), post_id: post.id, author_id: user2.id) }
  it 'Update likes counter' do
    expect(subject.send(:update_likes_count)).to_not eq(0)
  end
end
