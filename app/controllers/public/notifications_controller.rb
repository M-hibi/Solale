class Public::NotificationsController < ApplicationController
  def destroy
    @notifications = current_user.notifications.destroy_all
     redirect_to request.referer
  end
end
