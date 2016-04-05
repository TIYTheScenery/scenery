class PerformancesController < ApplicationController

  def create
    @performance = Performance.new(performance_params)
    if @performance.save
      @success = true
      @performance.save
    else
      @success = false
    end
  end

  private
  def performance_params
    params.require(:performance).permit(:id, :name, :description, :owner_id, :company_id, :trailer_link, :ticket_link, show_times_attributes: [:event_id, :event_type, :begin_time, :end_time, :venue_id, :address, :city, :state, :zip_code, :date, :_destroy])
  end
end
