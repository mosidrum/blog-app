class Post < ApplicationRecord
  belongs_to :user, foreign_key: 'authorId_id'
  has_many :comments
  has_many :likes

  validates :title, presence: true, length: { maximum: 250 }
  validates :commentsCounter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :likesCounter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  after_create :update_post_counter

  def update_post_counter
    user.increment!(:postCounter)
  end

  def recent_comments
    comments.order(created_at: :desc).limit(5)
  end
end
