module Trader
    class DashboardController < ApplicationController
      before_action :authenticate_user!
      before_action :check_trader
  
      def index
        # Trader dashboard logic
      end
  
      private
  
      def check_trader
        redirect_to root_path unless current_user.trader?
      end
    end
  end
  