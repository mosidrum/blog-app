class User < ApplicationRecord
  has_many :posts, foreign_key: 'author_id'
  has_many :comments
  has_many :likes

  after_create :recent_posts
  validates :name, presence: true
  validates :posts_counter, numericality: { greater_than_or_equal_to: 0 }, allow_nil: true
  def recent_posts
    posts.order(created_at: :desc).limit(3)
  end
end
