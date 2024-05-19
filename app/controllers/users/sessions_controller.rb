class Users::SessionsController < Devise::SessionsController
  def new
  end

  def create
  end
  
  def destroy
  end
  
  def guest_sign_in
    user = User.guest
    sign_in user
    redirect_to user_path(user), notice: "guestuserでログインしました。"
  end
end