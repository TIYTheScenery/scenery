class OpportunitiesController < ApplicationController
  before_action :authenticate_user, only: [:create, :update, :delete]
  before_action :authenticate_professional, only: [:create, :update, :delete]

  def create
    @opportunity = Opportunity.new(opportunity_params)
    @success = @opportunity.save
  end

  def index
    @opportunities = Opportunity.all
  end

  def show
    @opportunity = Opportunity.where(id: params[:id]).first
  end

  def update
    @opportunity = Opportunity.find_by(id: opportunity_params[:id])
    @success = @opportunity.update(opportunity_params)
  end

  def destroy
    @opportunity = Opportunity.find(params[:id])
    @success = @opportunity.destroy
  end
  private
  def opportunity_params
    params.require(:opportunity).permit(:id, :name, :description, :contact_info, :company_id, :venue_id)
  end
end
