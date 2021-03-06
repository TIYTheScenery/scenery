class CompaniesController < ApplicationController
  before_action :authenticate_user, only: [:create, :edit, :update, :destroy]
  before_action :authenticate_professional, only: [:create, :edit, :update, :destroy]
  before_action :company_authorized_user, only: [:update, :destroy]

  def create
    @company = Company.new(company_params)
    @success = @company.save
    @user = User.find_by(login_token: params[:user_info][:login_token])
  end

  def show
    @company = Company.find_by(id: params[:id])
    @upcoming_performances = @company.upcoming_performances
    @past_performances = @company.past_performances
  end

  def update
    @company = Company.find_by(id: company_params[:id])
    @success = @company.update(company_params)
  end

  def destroy
    @company = Company.find(params[:id])
    @success = @company.destroy
    @user = User.find_by(login_token: params[:user_info][:login_token])
  end

  private
  def company_params
    params.require(:company).permit(:id, :user_id, :name, :description, :website_link, :facebook_link, :twitter_link, :instagram_link, :youtube_link, :address, :city, :state, :zip_code, :profile_image, :hero_image,
    reviews_attributes: [:id, :opinion, :user_id, :rating, :reviewee_id, :reviewee_type, :_destroy])
  end
end
