class Employee::BaseController < ApplicationController
  before_filter :authenticate_employee!

  protected
  def authenticate_employee!
    authenticate_user!
    if !employee_signed_in?
      redirect_to root_path
    end
  end

  def current_employee
    current_user.authenticated_entity if employee_signed_in?
  end

  def employee_signed_in?
    user_signed_in? && current_user.authenticated_entity_type == 'Employee'
  end
end
