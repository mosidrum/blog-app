require 'rails_helper'

RSpec.feature 'Post Index Page' do
  before(:each) do
    @secondUser = create(:user)
    @firstUser = create(:user, name: 'user1', bio: 'Teacher from Uganda', photo: 'user1_profile_image.jpg', posts_counter: 0)
    @firstPost = create(:post, author_id: @firstUser.id, title: 'Hello')
    @secondPost = create(:post, author_id: @firstUser.id, title: 'World', text: 'Hi men', comments_counter: 1, likes_counter: 2)
    @comment = create(:comment, post_id: @secondPost.id, user_id: @secondUser.id, text: 'a comment')
  end

  it 'see the username of the user' do
    visit user_posts_path(@firstUser)
    expect(page).to have_content(@firstUser.name)
  end

  it 'see the profile picture of each user' do
    visit user_posts_path(@firstUser)
    expect(page).to have_css('img[src*="user1_profile_image.jpg"]')
  end

  it 'see the number of posts for each user' do
    visit user_posts_path(@firstUser)
    expect(page).to have_content(@firstUser.posts_counter)
  end

  it 'see a post title' do
    visit user_posts_path(@firstUser)
    expect(page).to have_content(@secondPost.title)
  end

  it 'see the post body' do
    visit user_posts_path(@firstUser)
    expect(page).to have_content(@secondPost.text)
  end

  it 'see the comments for a post' do
    visit user_posts_path(@firstUser)
    expect(page).to have_content(@comment.text)
  end

  it 'see number of comments for a post' do
    visit user_posts_path(@firstUser)
    expect(page).to have_content(@secondPost.comments_counter)
  end

  it 'see the number of likes for a post' do
    visit user_posts_path(@firstUser)
    expect(page).to have_content(@secondPost.likes_counter)
  end

  it 'Click a user\'s post, redirects to post\'s show page' do
    visit user_path(@firstUser)
    expect(page).to have_link(@secondPost.title)
    click_link @secondPost.title
    expect(current_path).to eq(user_post_path(@firstUser, @secondPost))
  end
end
