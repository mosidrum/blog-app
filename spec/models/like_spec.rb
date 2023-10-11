# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Comment, type: :model do
  describe 'Comment model' do
    user1 = User.new(name: 'isaac ayodele', photo: 'mosiron.jpeg',
                     bio: 'musician, programmer and drummer', posts_counter: 0)
    user2 = User.new(name: 'serina helen', photo: 'serina.jpeg',
                     bio: 'she loves to cook and dance', posts_counter: 0)
    post = Post.new(title: 'Rain', text: 'I love rain fall', author: user1, likes_counter: 5,
                    comments_counter: 2)
    like = Like.create(post:, user: user2)

    it 'should increase likes count on the post' do
      expect do
        like.update_likes_counter
        post.reload
      end.to change(post, :likes_counter).by(1)
    end
  end
end
