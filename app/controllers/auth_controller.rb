class AuthController < ApplicationController

  def render_data(data, status)
    render json: data, status: status, callback: params[:callback]
  end

  def render_error(message, status = :unprocessable_entity)
    render_data({ error: message }, status)
  end

  def render_success(data, status = :ok)
    if data.is_a? String
      render_data({ message: data }, status)
    else
      render_data(data, status)
    end
  end

  def signup
    @user = User.create auth_params
    render json: { token: Token.encode(@user.id) }
  end

  def login
    @user = User.find_by email: params[:email] if params[:email].present?

    if @user && @user.authenticate(params[:password])
      render json: { token: Token.encode(@user.id) }
    else
      render json: { message: 'Invalid credentials' }, status: :unauthorized
    end
  end

  def authenticate
    @oauth = "Oauth::#{params['provider'].titleize}".constantize.new(params)
    if @oauth.authorized?
      @user = User.from_auth(@oauth.formatted_user_data, current_user)
      if @user
        render_success(token: Token.encode(@user.id), id: @user.id)
      else
        render_error "This #{params[:provider]} account is used already"
      end
    else
      render_error("There was an error with #{params['provider']}. please try again.")
    end
  end

  private

    def auth_params
      params.require(:auth).permit(:email, :password, :displayName)
    end

end
