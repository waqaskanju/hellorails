# helper method
require 'rails_helper'

# Assert that user is a model
RSpec.describe User, type: :model do
  subject { User.create(name: 'Waqas', photo: 'http://www.waqas', bio: 'This is a story', posts_counter: 0) }

  # test 1 name shold not be empty.
  it 'The name should not be empty' do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  # Post counter value shoud be greater or equal to zero
  it 'PostsCounter value >=0' do
    subject.posts_counter = 3
    expect(subject).to be_valid
  end

  # post counter valude should not be negative.
  it 'PostsCounter value >=0' do
    subject.posts_counter = -2
    expect(subject).to_not be_valid
  end

  # shouwl show recent 3 posts.
  it 'Show recent posts method' do
    8.times { subject.posts.create(title: 'p title ', text: 'txt post', comments_counter: 10, likes_counter: 2) }
    expect(subject.recent_posts()).to eq(3)
  end
end
