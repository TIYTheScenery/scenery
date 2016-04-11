class CompaniesController < ApplicationController
  before_action :authenticate_user, only: [:create, :edit, :update, :delete]
  before_action :authenticate_professional, only: [:create, :edit, :update, :delete]

  def create
    @company = Company.new(company_params)
    @success = @company.save
  end

  def show
    @company = Company.where(id: params[:id]).first
    performances = Performance.where(id: params[:company_id])
    @peformances = performances.select {|per| per.past_production?}
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
