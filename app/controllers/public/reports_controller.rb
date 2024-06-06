class Public::ReportsController < ApplicationController
  def create
    post = Post.find(params[:post_id])
    report = current_user.reports.new(post_id: post.id)
    report.save
    redirect_to request.referer, notice: "Solaleを通報しました。運営にて確認後、問題があれば削除されます"
  end

  def destroy
    post = Post.find(params[:post_id])
    report = current_user.reports.find_by(post_id: post.id)
    report.destroy
    redirect_to request.referer, notice: "通報を取り消しました"
  end
end
