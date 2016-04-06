class PerformancesController < ApplicationController
  before_action :authenticate_user, only: [:create]

  def index
    render json: Performance.all
  end

  def create
      @performance = Performance.new(performance_params)
      @success = @performance.save
    else
      data = File.read("#{Rails.root}/public/user_not_logged_in.json")
      render :json => data
  end

  def index
      @performances = Performance.all
  end

  def show
    @performance = Performance.new(performance_params)
    @success = @performance.save
  end

  private
  def performance_params
    params.require(:performance).permit(:id, :name, :description, :owner_id, :company_id, :trailer_link, :ticket_link,
    show_times_attributes: [:id, :event_id, :begin_time, :end_time, :venue_id, :address, :city, :state, :zip_code, :date, :_destroy],)
  end
end
