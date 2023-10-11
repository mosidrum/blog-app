# frozen_string_literal: true

class LikesController < ApplicationController
  def new
    @like = Like.new
  end

  def create
    @post = Post.find(params[:post_id])
    @like = Like.new(post_id: @post.id, user_id: current_user.id)

    if @like.save
      redirect_to user_post_path(user_id: @post.author_id, id: @post.id)
    else
      render :new, alert: "Can't create another like"
    end
  end
end
