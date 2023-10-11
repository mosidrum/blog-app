require 'rails_helper'

RSpec.describe Post, type: :model do
  user = User.new(
    name: 'Me myself',
    photo: 'https://memyself.com/photos/memyself',
    bio: 'talk about me',
    posts_counter: 10
  )

  post = Post.new(
    author: user,
    title: 'Post one',
    text: 'This is my post one'
  )

  describe 'custom validations checks in Post model' do
    it 'title is not empty' do
      post.title = ''
      expect(post).to_not be_valid
    end

    it 'comments counter is an integer' do
      post.comments_counter = 'not-an-integer'
      expect(post).to_not be_valid
    end

    it 'likes counter is an integer' do
      post.likes_counter = 'not-an-integer'
      expect(post).to_not be_valid
    end
  end

  describe 'custom methods in Post' do
    it 'user post count' do
      expect do
        post.update_user_post_count
      end.to change(user, :posts_counter).by(1)
    end

    it 'checks most recent 5 comments' do
      expect(post.recent_comments).to eq(post.comments.last(5))
      puts post.comments.last(5)
    end
  end
end
