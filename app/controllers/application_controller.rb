class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  helper_method :current_user, :current_user_have_team?, :log_in?

  private

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def log_in?
    current_user != nil
  end

  def current_user_have_team?(team = nil)
    log_in? && current_user.have_team?(team)
  end
end
