require 'rails_helper'

RSpec.describe Post, type: :model do
  it 'is valid with valid attributes' do
    user = User.create(name: 'John Doe')
    post = Post.new(title: 'Sample Post', commentsCounter: 2, likesCounter: 5, user: user)
    expect(post).to be_valid
  end

  it 'is not valid without a title' do
    user = User.create(name: 'John Doe')
    post = Post.new(commentsCounter: 2, likesCounter: 5, user: user)
    expect(post).to_not be_valid
  end

  it 'is not valid with a long title' do
    user = User.create(name: 'John Doe')
    post = Post.new(title: 'A' * 251, commentsCounter: 2, likesCounter: 5, user: user)
    expect(post).to_not be_valid
  end

  it 'is not valid with a negative comments_counter' do
    user = User.create(name: 'John Doe')
    post = Post.new(title: 'Sample Post', commentsCounter: -1, likesCounter: 5, user: user)
    expect(post).to_not be_valid
  end

  it 'is not valid with a negative likes_counter' do
    user = User.create(name: 'John Doe')
    post = Post.new(title: 'Sample Post', commentsCounter: 2, likesCounter: -1, user: user)
    expect(post).to_not be_valid
  end

  it 'is valid with zero counters' do
    user = User.create(name: 'John Doe')
    post = Post.new(title: 'Sample Post', commentsCounter: 0, likesCounter: 0, user: user)
    expect(post).to be_valid
  end
end
