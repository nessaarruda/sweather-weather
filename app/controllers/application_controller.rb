class ApplicationController < ActionController::API
  include ActionController::Helpers
  helper_method :valid_api_key?

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def valid_api_key?(user_key)
    User.exists?(api_key: user_key)
  end
end
