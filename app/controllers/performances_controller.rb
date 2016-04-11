class PerformancesController < ApplicationController
  before_action :authenticate_user, only: [:create, :edit, :update, :delete]
  before_action :authenticate_professional, only: [:create, :edit, :update, :delete]

  def edit
  end

  def update
    @performance = Performance.find_by(id: performance_params[:id])
    @success = @performance.update(performance_params)
  end

  def create
    @performance = Performance.new(performance_params)
    @success =  @performance.save
  end

  def index
    @performances = Performance.all
  end

  def show
    @performance = Performance.where(id: params[:id]).first
  end

  def destroy
    @performance = Performance.find(params[:id])
    @success =  @performance.destroy
  end

  private
  def performance_params
    params.require(:performance).permit(:id, :name, :description, :owner_id, :company_id, :trailer_link, :ticket_link,
    show_times_attributes: [:id, :event_id, :begin_time, :end_time, :venue_id, :address, :city, :state, :zip_code, :show_date, :_destroy],
    genre_performances_attributes: [:id, :performance_id, :genre_id])
  end
end
