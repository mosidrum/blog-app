class Post < ApplicationRecord
  belongs_to :user
  has_many :commemts
  has_many :likes

  after_create :update_post_counter

  def update_post_counter
    user.increment!(:postCounter)
  end

  def recent_comments
    comments.order(created_at: :desc).limit(5)
  end
end
