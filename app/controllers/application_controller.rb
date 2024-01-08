class ApplicationController < ActionController::Base
  def require_login
    unless current_user
      flash[:alert] = "You must log in first"
      redirect_to new_user_session_path
    end
  end
end
