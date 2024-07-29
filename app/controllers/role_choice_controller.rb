# app/controllers/role_choice_controller.rb
class RoleChoiceController < ApplicationController
  before_action :authenticate_user!

  def index
    # This will render the role choice form
  end

  def update
    if params[:role].present?
      current_user.update(role: params[:role])
      redirect_to appropriate_dashboard_path
    else
      redirect_to role_choice_path, alert: 'Please select a role.'
    end
  end

  private

  def appropriate_dashboard_path
    if current_user.admin?
      admin_dashboard_path
    elsif current_user.trader?
      trader_dashboard_path
    else
      root_path
    end
  end
end
