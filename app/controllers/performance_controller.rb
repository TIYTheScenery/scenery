class PerformanceController < ApplicationController
  def create
    @performance = Performance.new(performance_params)

    @success = @performance.save

  end

  private
  def performance_params
    params.require(:performance).permit(:id, :name, :description, :owner_id, :company_id, :trailer_link, :ticket_link)
  end
end
