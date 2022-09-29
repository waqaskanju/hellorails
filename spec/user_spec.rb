# helper method
require 'rails_helper'

# Assert that user is a model
RSpec.describe User, type: :model do
  subject { User.create(name: 'Waqas', photo: 'http://www.waqas.com', bio: 'This is a story', postscounter: 0) }

  # test 1 name shold not be empty.
  it 'The name should not be empty' do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  # Post counter value shoud be greater or equal to zero
  it 'postscounter value >=0' do
    subject.postscounter = 3
    expect(subject).to be_valid
  end

  # post counter valude should not be negative.
  it 'PostsCounter value >=0' do
    subject.postscounter = -2
    expect(subject).to_not be_valid
  end

  #  show recent 3 posts.
  it ' recent posts showing' do
    3.times { subject.posts.create(Title: 'p title ', Text: 'txt post', CommentsCounter: 10) }
    expect(subject.recent_posts).not_to be_empty
  end
end
