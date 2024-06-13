class Admin::ReportsController < ApplicationController
    def index
    @reports = Report.all
        
        reports = Report.where(user_id: @user.id).pluck(:post_id)
        @report_users = User.find(reports)
    
        @user = User.find(params[:id])
      	@posts = @user.posts
        @report_posts = Post.find(reports)
    end
end
