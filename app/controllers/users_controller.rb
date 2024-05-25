class UsersController < ApplicationController
  before_action :is_matching_login_user, only: [:edit, :update]

  def show
    @user = User.find(params[:id])
  	@posts = @user.posts
  end
  
  def edit
    @user = User.find(params[:id])
   unless @user.id == current_user.id
    redirect_to user_path(current_user.id)
   end
  end   
  
  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to user_path(@user.id),notice:"You edited user"
    else
    render:edit
    end
  end
  
  def confirm
  end

  def withdraw
    @user = User.find(current_user.id)
    @user.update(is_active: true)
    reset_session
    flash[:notice] = "今までのご利用ありがとうございました。"
    redirect_to root_path  
  end

  private
  def user_params
    params.require(:user).permit(:name, :introduction)
  end
  
  
  def is_matching_login_user
    user = User.find(params[:id])
    unless user.id == current_user.id
      redirect_to user_path(current_user.id)
    end
  end  

end
