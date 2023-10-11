# frozen_string_literal: true

# rubocop:disable Metrics/BlockLength
require 'rails_helper'
RSpec.feature 'Post Show Page' do
  before(:each) do
    @first_user = create(
      :user, name: 'first_user', bio: 'Teacher from Uganda', photo: 'first_user_profile_image.jpg', posts_counter: 0
    )
    @second_user = create(:user, name: 'second_user')
    @post = create(
      :post, author_id: @first_user.id, title: 'Hello', comments_counter: 2, likes_counter: 1, text: 'Post body'
    )
    @comment = create(:comment, user_id: @second_user.id, post_id: @post.id, text: 'my comment')
  end

  it 'sees the title of the post' do
    visit user_post_path(@first_user, @post)
    expect(page).to have_content(@post.title)
  end

  it 'sees the name of user of post' do
    visit user_post_path(@first_user, @post)
    expect(page).to have_content(@first_user.name)
  end

  it 'see the number of likes of post' do
    visit user_post_path(@first_user, @post)
    expect(page).to have_content(@post.likes_counter)
  end

  it 'see the body of post' do
    visit user_post_path(@first_user, @post)
    expect(page).to have_content(@post.text)
  end

  it 'see the username of commenters' do
    visit user_post_path(@first_user, @post)
    expect(page).to have_content(@second_user.name)
  end

  it 'see the comment of each commenters' do
    visit user_post_path(@first_user, @post)
    expect(page).to have_content(@comment.text)
  end
end

# rubocop:enable Metrics/BlockLength
