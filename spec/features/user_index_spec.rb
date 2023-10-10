require 'rails_helper'

RSpec.feature 'User Index Page' do
  before(:each) do
    @first_user = create(:user, name: 'first_user', photo: 'first_user_profile_image.jpg', posts_counter: 0)
    @second_user = create(:user, name: 'second_user', photo: 'second_user_profile_image.jpg', posts_counter: 1)
  end

  it 'sees the username of all other users' do
    visit users_path

    expect(page).to have_content(@first_user.name)
    expect(page).to have_content(@second_user.name)
  end

  it 'sees the profile picture for each user' do
    visit users_path

    expect(page).to have_css('img[src*="first_user_profile_image.jpg"]')
    expect(page).to have_css('img[src*="second_user_profile_image.jpg"]')
  end

  it 'sees the number of posts for each user' do
    visit users_path

    expect(page).to have_content(@first_user.posts_counter)
    expect(page).to have_content(@second_user.posts_counter)
  end

  it 'Click on a user, redirected to user\'s show page' do
    visit users_path
    click_link @first_user.name

    expect(current_path).to eq(user_path(@first_user))
  end
end