class ApplicationController < ActionController::Base
  helper_method :current_user,:logged_in?,:require_user

  def current_user
    @current_user || User.find(session[:user_id]) if session[:user_id]
  end

  def logged_in?
    !!current_user
  end

  def require_user
    if !logged_in?
      flash[:danger]="Hey You Gotta Login First"
      redirect_to root_path
    end
  end




end
