class PerformancesController < ApplicationController
  # before_action :authenticate_user
  def create
    @performance = Performance.new(performance_params)

    @success = @performance.save
  end

  private
  def performance_params
    params.require(:performance).permit(:id, :name, :description, :owner_id, :company_id, :trailer_link, :ticket_link,
    show_times_attributes: [:id, :begin_time, :end_time, :venue_id, :address, :city, :state, :zip_code, :date, :_destroy],)
  end
end
