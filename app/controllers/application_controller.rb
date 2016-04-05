class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :null_session

  def authenticate_user(token)
    user = User.find_by(login_token: token)
    return user
  end

  before_filter :set_format

  def set_format
    request.format = 'json'
  end

end
