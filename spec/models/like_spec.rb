require 'rails_helper'

RSpec.describe Comment, type: :model do
  describe 'Comment model' do
    user1 = User.new(name: 'Alice Johnson', photo: 'alice.jpg', bio: 'Photographer and traveler', postCounter: 0)
    user2 = User.new(name: 'Bob Smith', photo: 'bob.jpg', bio: 'Food lover', postCounter: 0)
    post = Post.new(title: 'Summer Vacation', text: 'Had a great time at the beach!', author: user1, likesCounter: 1,
                    commentsCounter: 1)
    like = Like.create(post:, user: user2)

    it 'should increase likes count on the post' do
      expect do
        like.update_like_counter
        post.reload
      end.to change(post, :likesCounter).by(1)
    end
  end
end