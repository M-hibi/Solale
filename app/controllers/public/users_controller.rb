class Public::UsersController < ApplicationController
  before_action :is_matching_login_user, only: [:edit, :update]
  before_action :set_user, only: [:followings]


  def show
    @user = User.find(params[:id])
  	@posts = @user.posts
    likes = Like.where(user_id: @user.id).pluck(:post_id)
    @like_posts = Post.find(likes)
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
      redirect_to user_path(@user.id),notice:"情報を更新しました"
    else
    render:edit
    end
  end
  
  def followings
    @users = @user.followings
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
  
  def set_user
    @user = User.find(params[:id])
  end
  
  def is_matching_login_user
    user = User.find(params[:id])
    unless user.id == current_user.id
      redirect_to user_path(current_user.id)
    end
  end  

end
