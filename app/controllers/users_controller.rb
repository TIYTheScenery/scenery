# require 'oauth.rb'

class UsersController < ApplicationController
  include Omniauth
  before_action :authenticate_user, only: [:logout, :update]

  def show
    @user = User.find_by(id: params[:id])
    @companies = Company.where(user_id: params[:id]) if @user.is_professional
  end

  def create
    @user = User.new(user_params)
    @user.email = user_params[:email].downcase
    if @user.save
      @success = true
      @user.login_token = SecureRandom.urlsafe_base64(32)
      @user.save
    else
      @success = false
    end
  end

  def index
    @users = User.all
  end

  def edit
  end

  def update
    @user = User.find_by(login_token: user_params[:login_token])
    @success = @user.update(user_params)
  end

  def options
    @user = User.find_by(login_token: user_params[:login_token])
    @success = @user.update(user_params)
  end

  def destroy
  end

  def login
    @user = User.find_by(email: user_params[:email].downcase)
    if @user && @user.authenticate(user_params[:password])
      @success = true
      @user.login_token = SecureRandom.urlsafe_base64(32)
      @user.save
    else
      @success = false
      @error = "User name or password is incorrect"
    end
  end

  def logout
    @user = User.find_by(login_token: user_params[:login_token])
    @user.login_token = nil
    @success = @user.save
  end

  def facebook_login
    # session_code = params[:code]
    # redirect = 'http://localhost:3000/auth/facebook'
    #
    # query =  "?client_id=#{ENV["FACEBOOK_APP_ID"]}&redirect_uri=#{redirect}&client_secret=#{ENV["FACEBOOK_SECRET"]}&code=#{session_code}"
    # query = 'https://graph.facebook.com/v2.5/oauth/access_token' + query
    # response = HTTParty.get(query)
    # access_token = response["access_token"]
    #
    # @user = HTTParty.get('https://graph.facebook.com/v2.5/me/?fields=id,name,first_name,last_name,email&access_token=' + access_token)
    @user_info, access_token = Omniauth::Facebook.authenticate(params['code'])
    if user_info['email'].blank?
      Omniauth::Facebook.deauthorize(access_token)
    end
    Rails.logger.debug @user_info
  end

  # def options
  #   set_access_control_headers
  #   head :ok
  # end

  private
    def user_params
      params.require(:user_info).permit(:id, :email, :password, :first_name, :last_name, :description, :is_professional, :display_name, :login_token, :facebook_link, :twitter_link, :instagram_link, :youtube_link,
      titles_attributes: [:id, :title, :_destroy])
    end

    # def set_access_control_headers
    #   headers['Access-Control-Allow-Origin'] = 'http://localhost:3000'
    #   headers['Access-Control-Allow-Methods'] = 'POST, GET, PATCH, OPTIONS'
    #   headers['Access-Control-Max-Age'] = '1000'
    #   headers['Access-Control-Allow-Headers'] = '*,content-type,cache-control'
    # end
end
