class Public::HomesController < ApplicationController
  def top
    @newposts = Post.order(created_at: :desc).limit(3)
  end
end
