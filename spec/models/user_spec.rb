require 'rails_helper'

RSpec.describe User, type: :model do
  user = User.new(
    name: 'Me myself',
    photo: 'https://memyself.com/photos/memyself',
    bio: 'talk about me',
    posts_counter: 13
  )

  describe 'custom validations checks' do
    it 'presence of the name' do
      user.name = nil
      expect(user).to_not be_valid
    end

    it 'posts_counter is an integer' do
      user.posts_counter = 'not-an-integer'
      expect(user).to_not be_valid
    end

    it 'posts_counter is greater than or equal to zero' do
      user.posts_counter = -1
      expect(user).to_not be_valid
    end
  end

  describe 'custom methods checks' do
    it 'checks the most recent 3 posts' do
      expect(user.recent_posts).to eq(user.posts.last(3))
    end
  end
end