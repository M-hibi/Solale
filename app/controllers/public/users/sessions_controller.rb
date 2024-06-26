class Public::Users::SessionsController < Devise::SessionsController
  def new
  end

  def create
  end

  def destroy
  end

  def guest_sign_in
    user = User.guest
    sign_in user
    redirect_to posts_path, notice: "guestuserでログインしました。"
  end


  before_action :reject_user, only: [:create]

  protected

  def reject_user
    @user = User.find_by(email: params[:user][:email].downcase)
    if @user
      if (@user.valid_password?(params[:user][:password]) && (@user.active_for_authentication? == false))
        flash[:error] = "退会済みです。"
        redirect_to new_user_session_path
      end
    else
      flash[:error] = "必須項目を入力してください。"
    end
  end
end