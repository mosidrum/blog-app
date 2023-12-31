class Post < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: :author_id

  validates :title, presence: true, length: { maximum: 250 }
  validates :comments_counter, numericality: { greater_than_or_equal_to: 0 }, allow_nil: true
  validates :likes_counter, numericality: { greater_than_or_equal_to: 0 }, allow_nil: true
  has_many :likes
  has_many :comments

  after_create :update_user_post_count
  after_create :recent_comments

  def update_user_post_count
    author.increment!(:posts_counter)
  end

  def recent_comments
    comments.limit(5).order(created_at: :desc)
  end

  alias_attribute :comments_count, :comments_counter
end
