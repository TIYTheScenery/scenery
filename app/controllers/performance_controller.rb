class PerformanceController < ApplicationController
  def create
    @performance = Performance.new(performance_params)

    if @performance.save
      render json: @performance, notice: "Performance was successfully created."
    else
      render :false, flash.now[:alert] = "Something went wrong. Please try again."
    end
  end

  private
  def performance_params
    params.require(:performance).permit(:id, :name, :description, :owner_id, :company_id, :trailer_link, :ticket_link)
  end
end
