class Admin::ApplicationController < ActionController::Base
  before_action :current_user, :require_user_logged_in!
  layout 'admin'

  def index
  end

  def current_user
    # session[:user_id] = nil
    @current_user ||= User.find(session[:user_id]) if session[:user_id].present?
  end

  def require_user_logged_in!
    redirect_to new_admin_session_path if current_user.nil?
  end

end
