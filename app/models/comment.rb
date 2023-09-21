class Comment < ApplicationRecord
  belongs_to :post

  after_create :update_comment_counter

  def update_comments_counter
    post.update(comments_counter: post.comments.count)
  end
end
