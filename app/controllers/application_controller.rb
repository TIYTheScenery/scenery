class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :null_session, except: :facebook_login

  def authenticate_user
    render json: File.read("#{Rails.root}/public/user_not_logged_in.json") unless params[:user_info][:login_token] && User.find_by(login_token: params[:user_info][:login_token])
  end

  def authenticate_professional
    user = User.find_by(login_token: params[:user_info][:login_token])
    render json: File.read("#{Rails.root}/public/user_not_professional.json") unless user.is_professional
  end

  before_filter :set_format

  def set_format
    request.format = 'json'
  end

end
