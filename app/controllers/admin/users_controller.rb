class Admin::UsersController < ApplicationController
    def destroy
        @user = User.find(params[:id])
        @user.destroy
        redirect_to admin_reports_path, notice: 'ユーザーを削除しました。'
    end
end
