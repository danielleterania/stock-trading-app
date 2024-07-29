# app/controllers/application_controller.rb

class ApplicationController < ActionController::Base
    after_action :redirect_user_based_on_type
  
    private
  
    def redirect_user_based_on_type
      return unless user_signed_in?
  
      if current_user.admin?
        redirect_to admin_dashboard_path # Replace with your admin dashboard path
      elsif current_user.trader?
        redirect_to trader_dashboard_path # Replace with your trader dashboard path
      end
    end
  end
  