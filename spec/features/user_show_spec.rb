require 'rails_helper'

RSpec.feature 'User Show Page' do
  before(:each) do
    @firstUser = create(:user, name: 'firstUser', bio: 'Great britain', photo: 'firstUser_profile_image.jpg', posts_counter: 0)
    @firstPost = create(:post, author_id: @firstUser.id, title: 'Victory is a fine girlfriend')
    @secondPost = create(:post, author_id: @firstUser.id, title: 'Drumming is my first love')
    @thirdPost = create(:post, author_id: @firstUser.id, title: 'Who goes there')
    @fourPost = create(:post, author_id: @firstUser.id, title: 'I am the father of music')
  end

  it 'sees the username of the user' do
    visit user_path(@firstUser)

    expect(page).to have_content(@firstUser.name)
  end

  it 'sees the profile picture for each user' do
    visit user_path(@firstUser)

    expect(page).to have_css('img[src*="firstUser_profile_image.jpg"]')
  end

  it 'sees the number of posts of the user' do
    visit user_path(@firstUser)

    expect(page).to have_content(@firstUser.posts_counter)
  end

  it 'sees the bio of the user' do
    visit user_path(@firstUser)

    expect(page).to have_content(@firstUser.bio)
  end

  it 'sees a button to view user\'s posts' do
    visit user_path(@firstUser)

    expect(page).to have_content('See all posts')
  end

  it 'sees the last 3 posts of the user' do
    visit user_path(@firstUser)

    expect(page).to have_text(@fourPost.title, wait: 5)
    expect(page).to have_text(@secondPost.title, wait: 5)
    expect(page).to have_text(@thirdPost.title, wait: 5)
  end

  it 'Clicked a user\'s post, redirects to post\'s show page' do
    visit user_path(@firstUser)
    expect(page).to have_link(@secondPost.title)
    click_link @secondPost.title

    expect(current_path).to eq(user_post_path(@firstUser, @secondPost))
  end

  it 'Clicked to see all posts, it redirects to user\'s post\'s index page' do
    visit user_path(@firstUser)

    click_link 'See all posts'

    expect(current_path).to eq(user_posts_path(@firstUser))
  end
end
