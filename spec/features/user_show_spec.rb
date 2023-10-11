# rubocop:disable Metrics/BlockLength
require 'rails_helper'
RSpec.feature 'User Show Page' do
  before(:each) do
    @first_user = create(
      :user, name: 'first_user', bio: 'Great britain', photo: 'first_user_profile_image.jpg', posts_counter: 0
    )
    @first_post = create(:post, author_id: @first_user.id, title: 'Victory is a fine girlfriend')
    @second_post = create(:post, author_id: @first_user.id, title: 'Drumming is my first love')
    @third_post = create(:post, author_id: @first_user.id, title: 'Who goes there')
    @fourth_post = create(:post, author_id: @first_user.id, title: 'I am the father of music')
  end

  it 'sees the username of the user' do
    visit user_path(@first_user)

    expect(page).to have_content(@first_user.name)
  end

  it 'sees the profile picture for each user' do
    visit user_path(@first_user)

    expect(page).to have_css('img[src*="first_user_profile_image.jpg"]')
  end

  it 'sees the number of posts of the user' do
    visit user_path(@first_user)

    expect(page).to have_content(@first_user.posts_counter)
  end

  it 'sees the bio of the user' do
    visit user_path(@first_user)

    expect(page).to have_content(@first_user.bio)
  end

  it 'sees a button to view user\'s posts' do
    visit user_path(@first_user)

    expect(page).to have_content('See all posts')
  end

  it 'sees the last 3 posts of the user' do
    visit user_path(@first_user)

    expect(page).to have_text(@fourth_post.title, wait: 5)
    expect(page).to have_text(@second_post.title, wait: 5)
    expect(page).to have_text(@third_post.title, wait: 5)
  end

  it 'Clicked a user\'s post, redirects to post\'s show page' do
    visit user_path(@first_user)
    expect(page).to have_link(@second_post.title)
    click_link @second_post.title

    expect(current_path).to eq(user_post_path(@first_user, @second_post))
  end

  it 'Clicked to see all posts, it redirects to user\'s post\'s index page' do
    visit user_path(@first_user)

    click_link 'See all posts'

    expect(current_path).to eq(user_posts_path(@first_user))
  end
end

# rubocop:enable Metrics/BlockLength
