class CompaniesController < ApplicationController
  before_action :authenticate_user, only: [:create, :edit, :update, :delete]
  before_action :authenticate_professional, only: [:create, :edit, :update, :delete]
  before_action :company_authorized_user, only: [:update, :destroy]

  def create
    @company = Company.new(company_params)
    user = User.find_by(login_token: params[:login_token])
    user.companies << @company
    @success = @company.save
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
  end

  private
  def company_params
    params.require(:company).permit(:id, :user_id, :name, :description, :website_link, :facebook_link, :twitter_link, :instagram_link, :youtube_link, :address, :city, :state, :zip_code)
  end
end
