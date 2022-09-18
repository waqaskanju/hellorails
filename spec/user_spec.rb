require 'rails_helper'

RSpec.describe User, type: :model do
  subject { User.create(name: 'Waqas', photo: 'http://www.waqas', bio: 'This is a story', posts_counter: 0) }

  it 'The name should not be empty' do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it 'PostsCounter value >=0' do
    subject.posts_counter = 3
    expect(subject).to be_valid
  end

  it 'PostsCounter value >=0' do
    subject.posts_counter = -2
    expect(subject).to_not be_valid
  end

  it 'Show recent posts method' do
    8.times { subject.posts.create(title: 'p title ', text: 'txt post', comments_counter: 10, likes_counter: 2) }
    expect(subject.show_recent_posts.count).to eq(8)
  end
end
