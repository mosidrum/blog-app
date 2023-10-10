require 'rails_helper'

RSpec.feature 'Post Index Page' do
  before(:each) do
    @second_user = create(:user)
    @first_user = create(:user, name: 'user1', bio: 'Teacher from Uganda', photo: 'user1_profile_image.jpg', posts_counter: 0)
    @first_post = create(:post, author_id: @first_user.id, title: 'Hello')
    @second_post = create(:post, author_id: @first_user.id, title: 'World', text: 'Hi men', comments_counter: 1, likes_counter: 2)
    @comment = create(:comment, post_id: @second_post.id, user_id: @second_user.id, text: 'a comment')
  end

  it 'see the username of the user' do
    visit user_posts_path(@first_user)
    expect(page).to have_content(@first_user.name)
  end

  it 'see the profile picture of each user' do
    visit user_posts_path(@first_user)
    expect(page).to have_css('img[src*="user1_profile_image.jpg"]')
  end

  it 'see the number of posts for each user' do
    visit user_posts_path(@first_user)
    expect(page).to have_content(@first_user.posts_counter)
  end

  it 'see a post title' do
    visit user_posts_path(@first_user)
    expect(page).to have_content(@second_post.title)
  end

  it 'see the post body' do
    visit user_posts_path(@first_user)
    expect(page).to have_content(@second_post.text)
  end

  it 'see the comments for a post' do
    visit user_posts_path(@first_user)
    expect(page).to have_content(@comment.text)
  end

  it 'see number of comments for a post' do
    visit user_posts_path(@first_user)
    expect(page).to have_content(@second_post.comments_counter)
  end

  it 'see the number of likes for a post' do
    visit user_posts_path(@first_user)
    expect(page).to have_content(@second_post.likes_counter)
  end

  it 'Click a user\'s post, redirects to post\'s show page' do
    visit user_path(@first_user)
    expect(page).to have_link(@second_post.title)
    click_link @second_post.title
    expect(current_path).to eq(user_post_path(@first_user, @second_post))
  end
end
