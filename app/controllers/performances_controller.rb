class PerformancesController < ApplicationController
  before_action :authenticate_user, only: [:create, :edit, :update, :delete]
  before_action :authenticate_professional, only: [:create, :edit, :update, :delete]

  def edit
  end

  def update
    if @performance = Performance.find_by(id: performance_params[:id])
      @success = @performance.update(performance_params)
    else
      @success = false
    end
  end

  def create
    if @performance = Performance.new(performance_params)
      @success = @performance.save
    else
      @success = false
    end
  end

  def index
      @performances = Performance.all
  end

  def show
    @performance = Performance.where(id: params[:id]).first
  end

  def destroy
    if @performance = Performance.find(params[:id])
      @success = @performance.destroy
    else
      @success = false
    end
  end

  private
  def performance_params
    params.require(:performance).permit(:id, :name, :description, :owner_id, :company_id, :trailer_link, :ticket_link,
    show_times_attributes: [:id, :event_id, :begin_time, :end_time, :venue_id, :address, :city, :state, :zip_code, :date, :_destroy],
    genre_performances_attributes: [:id, :performance_id, :genre_id])
  end
end
