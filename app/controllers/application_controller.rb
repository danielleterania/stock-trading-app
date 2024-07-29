class ApplicationController < ActionController::Base
  def after_sign_in_path_for(resource)
    if resource.role.nil? || resource.role.empty?
      role_choice_path
    elsif resource.admin?
      admin_dashboard_path
    elsif resource.trader?
      trader_dashboard_path
    else
      root_path
    end
  end
end
