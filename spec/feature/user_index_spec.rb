require 'rails_helper'
RSpec.feature 'User Index', type: :feature do
  before(:each) do
    @user_one = User.create(name: 'Klean', photo: 'https://placehold.co/200x133', bio: 'She is good programmer')
    @user_two = User.create(name: 'Crul', photo: 'https://placehold.co/200x133', bio: 'He is good programmer')
    @user_one.posts.create(title: 'Post 1', text: 'This is my first post.')
    @user_one.posts.create(title: 'Post 2', text: 'This is my second post.')
    @user_one.posts.create(title: 'Post 3', text: 'This is my third post.')
    @user_two.posts.create(title: 'Post 1', text: 'This is the beginning.')
    @user_two.posts.create(title: 'Post 2', text: 'This is the progress.')
  end
  describe 'User index page' do
    before(:each) { visit users_path }
    it 'display user name' do
      expect(page).to have_content('Klean')
      expect(page).to have_content('Crul')
    end
  end
end
