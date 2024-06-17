class Admin::UsersController < ApplicationController

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to request.referer, notice: "ユーザを削除しました。"
  end
end