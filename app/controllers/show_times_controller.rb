class ShowTimesController < ApplicationController
  def create
    @success = @show_time 
  end

  def edit
  end

  def show
  end

  def index
  end

  def destroy
  end

  private def show_time_params
    params.require(:show_time).permit(:event_id, :event_type, :begin_time, :end_time, :venue_id, :address, :city, :state, :zip_code, :date)
  end
end
