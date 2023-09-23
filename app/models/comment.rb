class Comment < ApplicationRecord
  belongs_to :post, foreign_key: 'postId_id'
  belongs_to :user, foreign_key: 'userId_id'

  after_create :update_comment_counter

  def update_comments_counter
    post.update(comments_counter: post.comments.count)
  end
end
