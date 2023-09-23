class Like < ApplicationRecord
  belongs_to :post
  belongs_to :user

  after_create :update_like_counter

  def update_like_counter
    post.increment!(:likesCounter)
  end
end
