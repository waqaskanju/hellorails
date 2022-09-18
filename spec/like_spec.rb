require 'rails_helper'

RSpec.describe Like, type: :model do
  user1 = User.create(name: 'Waqas', 
    photo: 'abc.com',
     bio: 'The bio text',
      posts_counter: 0)

  user2 = User.create(name: 'Ahamd',
     photo: 'def com', 
     bio: 'some bio text',
      posts_counter: 0)

  post = Post.create(author: user1,
    title: 'post title',
    text: 'Show me the ittle',
    comments_counter: 0,
    likes_counter: 0)

  subject { Like.create(post:, author: user2) }

  it 'Update likes counter' do
    expect(subject.send(:update_likes_count)).to eq(true)
  end
end
