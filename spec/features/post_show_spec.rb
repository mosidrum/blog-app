require 'rails_helper'

RSpec.feature 'Post Show Page' do
  before(:each) do
    @firstUser = create(:user, name: 'firstUser', bio: 'Teacher from Uganda', photo: 'firstUser_profile_image.jpg', posts_counter: 0)
    @secondUser = create(:user, name: 'secondUser')
    @post = create(:post, author_id: @firstUser.id, title: 'Hello', comments_counter: 2, likes_counter: 1, text: 'Post body')
    @comment = create(:comment, user_id: @secondUser.id, post_id: @post.id, text: 'my comment')
  end

  it 'sees the title of the post' do
    visit user_post_path(@firstUser, @post)
    expect(page).to have_content(@post.title)
  end

  it 'sees the name of user of post' do
    visit user_post_path(@firstUser, @post)
    expect(page).to have_content(@firstUser.name)
  end

  it 'see the number of likes of post' do
    visit user_post_path(@firstUser, @post)
    expect(page).to have_content(@post.likes_counter)
  end
    
  it 'see the body of post' do
    visit user_post_path(@firstUser, @post)
    expect(page).to have_content(@post.text)
  end

  it 'see the username of commenters' do
    visit user_post_path(@firstUser, @post)
    expect(page).to have_content(@secondUser.name)
  end

  it 'see the comment of each commenters' do
    visit user_post_path(@firstUser, @post)
    expect(page).to have_content(@comment.text)
  end
end