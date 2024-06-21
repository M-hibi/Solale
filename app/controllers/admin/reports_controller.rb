class Admin::ReportsController < ApplicationController
    def index
        @reports = Report.all.page(params[:page])
        @posts = Post.where(is_active: true)
    end

    def update
        @report = Report.find(params[:id])
        @report.post.update(is_active: true)
        @report.destroy
        redirect_to request.referer, notice: "投稿を非表示にしました"
    end

    def destroy
        @report = Report.find(params[:id])
        @report.destroy
        redirect_to request.referer, notice: "通報を取り消しました"
    end
end
