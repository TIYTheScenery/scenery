class PerformancesController < ApplicationController
  before_action :authenticate_user, only: [:create]

  def index
    render json: Performance.all
  end

  def create
    @performance = Performance.new(performance_params)
    @success = @performance.save
  end

  private
  def performance_params
    params.require(:performance).permit(:id, :name, :description, :owner_id, :company_id, :trailer_link, :ticket_link,
    show_times_attributes: [:id, :event_id, :begin_time, :end_time, :venue_id, :address, :city, :state, :zip_code, :date, :_destroy],
    genre_performances_attributes: [:id, :performance_id, :genre_id, genres_attributes: [:id]])
  end
  def user_params
    params.require(:user_info).permit(:login_token)
  end
end
