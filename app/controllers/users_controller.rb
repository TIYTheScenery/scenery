class UsersController < ApplicationController
  def show
  end

  def create
    @user = User.new(user_params)

    if @user.save
      # render :show, status: :created, location: @book
    else
      # render json: @book.errors, status: :unprocessable_entity
    end
  end

  def update
  end

  def destroy
  end

  def login
  end

  def logout
  end

  private def user_params
    params.require(:user_info).permit(:email, :password, :first_name, :last_name, :description, :professional, :display_name, :login_token)
  end
end
