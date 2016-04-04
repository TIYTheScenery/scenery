class PerformanceController < ApplicationController
  def create
    @performance = Performance.new(performance_params)

    if @performance.save
      redirect_to performances_path, notice: "Performance was successfully created."
    else
      render :new
    end
  end

  private
  def performance_params
    params.require(:performance).permit(:id, :name, :description, :owner_id, :company_id, :trailer_link, :ticket_link)
  end
end
