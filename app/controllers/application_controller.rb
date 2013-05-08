class ApplicationController < ActionController::Base
  protect_from_forgery
  # This is used throughout the app to scope queries, like
  # current_account.users, etc.
  def current_account(raise_on_not_found = true)
    @current_account ||= Account.find_by_full_domain(request.host)
    raise ActiveRecord::RecordNotFound if !@current_account && raise_on_not_found
    @current_account
  end
end
