class User < ApplicationRecord
  has_many :posts, foreign_key: 'user_id'
  has_many :comments, foreign_key: 'authorId_id'
  has_many :likes, foreign_key: 'authorId_id'

  validates :name, presence: true
  validates :postCounter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }, allow_nil: true

  def recent_posts
    posts.order(created_at: :desc).limit(3)
  end
end
