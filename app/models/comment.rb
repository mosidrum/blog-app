class Comment < ApplicationRecord
  belongs_to :user, class_name: 'User', foreign_key: :user_id
  belongs_to :post

  after_create :update_comments_counter

  def update_comments_counter
    post.increment!(:comments_counter)
  end
end
