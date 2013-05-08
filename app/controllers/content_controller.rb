class ContentController < ApplicationController
  def show
    if current_user
      case current_user.authenticated_entity_type
      when 'Admin'
        redirect_to admin_root_path
      when 'Employee'
        redirect_to employee_root_path
      when 'Contact'
        redirect_to contact_root_path
      end
    end
  end
end