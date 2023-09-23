require 'rails_helper'

RSpec.describe Comment, type: :model do
  describe 'Comment model' do
    user1 = User.new(name: 'isaac ayodele', photo: 'mosiron.jpeg', bio: 'musician, programmer and drummer', posts_counter: 0)
    user2 = User.new(name: 'serina helen', photo: 'serina.jpeg', bio: 'she loves to cook and dance', posts_counter: 0)
    post = Post.new(title: 'Summer Vacation', text: 'Had a great time at the beach!', author: user1, likes_counter: 2,
                    comments_counter: 1)
    comment = Comment.create(post:, user: user2, text: 'serina is a good girl')

    it 'should increase comments count on the post' do
      expect do
        comment.update_comments_counter
        post.reload
      end.to change(post, :comments_counter).by(1)
    end
  end
end