class Admin::BaseController < ApplicationController
  before_filter :authenticate_admin!

  protected
  def authenticate_admin!
    authenticate_user!
    if !admin_signed_in?
      redirect_to root_path
    end
  end

  def current_admin
    current_user.authenticated_entity if admin_signed_in?
  end

  def admin_signed_in?
    user_signed_in? && current_user.authenticated_entity_type == 'Admin'
  end
end
