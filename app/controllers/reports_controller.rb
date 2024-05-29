class ReportsController < ApplicationController
  def create
    post = Post.find(params[:post_id])
    report = current_user.reports.new(post_id: post.id)
    report.save
    redirect_to post_path(post)
  end

  def destroy
    post = Post.find(params[:post_id])
    report = current_user.reports.find_by(post_id: post.id)
    report.destroy
    redirect_to post_path(post)
  end
end
