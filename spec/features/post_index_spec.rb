require 'rails_helper'
RSpec.feature 'Post Index Page' do
  before(:each) do
    @user2 = create(:user)
    @user1 = create(:user, name: 'user1', bio: 'Teacher from Uganda', photo: 'user1_profile_image.jpg', posts_counter: 0)
    @post1 = create(:post, author_id: @user1.id, title: 'Hello')
    @post2 = create(:post, author_id: @user1.id, title: 'World', text: 'Hi men', comments_counter: 1, likes_counter: 2)
    @comment = create(:comment, post_id: @post2.id, user_id: @user2.id, text: 'a comment')
  end
  scenario 'I can see the username of the user' do
    visit user_posts_path(@user1)
    expect(page).to have_content(@user1.name)
  end
end
