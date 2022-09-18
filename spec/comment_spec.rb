require 'rails_helper'

RSpec.describe Comment, type: :model do
  user1 = User.create(name: 'Waqas', photo: 'http://www.abc.com', bio: 'This is the story of a person',
                      posts_counter: 0)

  subject do
    Comment.create(
      post: Post.create(
        author: user1,
        title: 'First Post',
        text: 'An Amazing story',
        comments_counter: 2,
        likes_counter: 5
      ),
      author: user1,
      text: 'This is comment text'
    )
  end

  it 'Comment should not be empty' do
    subject.text = ''
    expect(subject).to_not be_valid
  end

  it 'Update comments counter method' do
    expect(subject.update_comments_counter).to eq(3)
  end
end
