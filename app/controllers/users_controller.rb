class UsersController < ApplicationController
  before_action :authenticate_user, only: [:logout]

  def show
      @user = User.find_by(id: params[:id])
  end

  def create
    @user = User.new(user_params)
    if @user.save
      @success = true
      @user.login_token = SecureRandom.urlsafe_base64(32)
      @user.save
    else
      @success = false
    end
  end

  def edit
  end

  def update
    @user = User.find_by(login_token: user_params[:login_token])
    if @user.update(user_params)
      @success = true
    else
      @success = false
    end
  end

  def destroy
  end

  def login
    @user = User.find_by(email: user_params[:email])
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
    user_info, access_token = Omniauth::Facebook.authenticate(params['code'])
    if user_info['email'].blank?
      Omniauth::Facebook.deauthorize(access_token)
    end
  end

  private
    def user_params
      params.require(:user_info).permit(:email, :password, :first_name, :last_name, :description, :is_professional, :display_name, :login_token, :facebook_link, :twitter_link, :instagram_link, :youtube_link,
      titles_attributes: [:id, :title, :_destroy])
    end
end
