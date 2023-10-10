require 'rails_helper'

RSpec.feature 'User Index Page' do
  before(:each) do
    @firstUser = create(:user, name: 'firstUser', photo: 'firstUser_profile_image.jpg', posts_counter: 0)
    @secondUser = create(:user, name: 'secondUser', photo: 'secondUser_profile_image.jpg', posts_counter: 1)
  end

  it 'sees the username of all other users' do
    visit users_path

    expect(page).to have_content(@firstUser.name)
    expect(page).to have_content(@secondUser.name)
  end

  it 'sees the profile picture for each user' do
    visit users_path

    expect(page).to have_css('img[src*="firstUser_profile_image.jpg"]')
    expect(page).to have_css('img[src*="secondUser_profile_image.jpg"]')
  end

  it 'sees the number of posts for each user' do
    visit users_path

    expect(page).to have_content(@firstUser.posts_counter)
    expect(page).to have_content(@secondUser.posts_counter)
  end

  it 'Click on a user, redirected to user\'s show page' do
    visit users_path
    click_link @firstUser.name

    expect(current_path).to eq(user_path(@firstUser))
  end
end