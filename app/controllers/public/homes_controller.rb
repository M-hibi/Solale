class Public::HomesController < ApplicationController
  def top
    @newposts = Post.where(is_active: false).order(created_at: :desc).limit(3)
  end
end
