class ApplicationController < ActionController::API
  include ActionController::Helpers # added to get access to current_user
  helper_method :current_user

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
end
