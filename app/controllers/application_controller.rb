class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :null_session

  def authenticate_user
    render json: File.read("#{Rails.root}/public/user_not_logged_in.json") unless params[:user_info][:login_token] && User.find_by(login_token: params[:user_info][:login_token])
  end

  def authenticate_professional
    user = User.find_by(login_token: params[:user_info][:login_token])
    render json: File.read("#{Rails.root}/public/user_not_professional.json") unless user.is_professional
  end

  def company_authorized_user
    user = User.find_by(login_token: params[:user_info][:login_token])
    render json: File.read("#{Rails.root}/public/user_not_authorized_company.json") unless Company.find_by(user_id: user.id)
  end

  def performance_authorized_user
    user = User.find_by(login_token: params[:user_info][:login_token])
    render json: File.read("#{Rails.root}/public/user_not_authorized_performance.json") unless Performance.find_by(company_id: performance_params[:company_id]) && Performance.find_by(owner_id: user.id)
  end

  def review_authorized_user
    user = User.find_by(login_token: params[:user_info][:login_token])
    render json: File.read("#{Rails.root}/public/user_not_authorized_review.json") unless Review.find_by(user_id: user.id)
  end

  before_filter :set_format

  def set_format
    request.format = 'json'
  end

end
