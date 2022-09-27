# Add help method
require 'rails_helper'

# Descriibe that Post is a type of model
RSpec.describe Post, type: :model do
  subject do
    user = User.create(
      name: 'waqas',
      photo: 'httP://www.abc.com',
      bio: 'A bio post',
      postscounter: 0
    )
    Post.create(
      author_id: user.id,
      Title: 'Title of the post',
      Text: 'Some text of the mpost',
      CommentsCounter: 0,
      LikesCounter: 0
    )
  end

  # Create first test that title should not be empty.

  it 'Title should not be empty' do
    subject.Title = nil
    expect(subject).to_not be_valid
  end

  # Create 2nd test that the lenght of title will not execed 250

  it 'title length shoud not be > 250' do
    subject.Title = 'hi' * 50
    expect(subject).to be_valid
  end

  # Create 3rd test if it is greated that 250 it should fial

  it 'title length should not be > 250' do
    subject.Title = 'bye' * 300
    expect(subject).to_not be_valid
  end

  # 4th test counter should be integer

  it 'Comments counter should be integer' do
    subject.CommentsCounter = -5
    expect(subject).to_not be_valid
  end

  # fifth test like counte should be integer greater than zero.

  it 'Likes counter must be an integer greater than or equal to zero.' do
    subject.LikesCounter = -10
    expect(subject).to_not be_valid
  end

  # six thest comment count should be integer
  it 'comment counter an integer' do
    expect(subject.CommentsCounter).to be_an_integer
  end

  # seventh text post count shold update
  it 'Update post counter method' do
    expect(subject.update_posts_count).to_not eq(0)
  end
end
