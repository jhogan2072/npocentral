class Contact::BaseController < ApplicationController
  before_filter :authenticate_contact!

  protected
  def authenticate_contact!
    authenticate_user!
    if !contact_signed_in?
      redirect_to root_path
    end
  end

  def current_contact
    current_user.authenticated_entity if contact_signed_in?
  end

  def contact_signed_in?
    user_signed_in? && current_user.authenticated_entity_type == 'Contact'
  end
end
