# frozen_string_literal: true

class Admin::SessionsController < Devise::SessionsController
  protected

  def after_sign_in_path_for(resource)
    admin_reports_path
  end

  def after_sign_out_path_for(resource_or_scope)
    new_admin_session_path
  end
end
