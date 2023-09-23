require 'rails_helper'

RSpec.describe Comment, type: :model do
  it 'is valid with valid attributes' do
    user = User.create(name: 'John Doe')
    post = Post.create(title: 'Sample Post', commentsCounter: 2, likesCounter: 5, user: user)
    comment = Comment.new(text: 'Test comment', user: user, post: post)
    expect(comment).to be_valid
  end

  it 'is not valid without text' do
    user = User.create(name: 'John Doe')
    post = Post.create(title: 'Sample Post', commentsCounter: 2, likesCounter: 5, user: user)
    comment = Comment.new(text: 'Test comment', user: user, post: post)
    expect(comment).to be_valid
  end
end
