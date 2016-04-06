class PerformancesController < ApplicationController

  def create
    # if authenticate_user(user_params[:login_token])
      @performance = Performance.new(performance_params)
      @success = @performance.save
    else
      data = File.read("#{Rails.root}/public/user_not_logged_in.json")
      render :json => data
    # end
  end

  def index
      @performances = Performance.all
  end

  def show
    
  end

  private
  def performance_params
    params.require(:performance).permit(:id, :name, :description, :owner_id, :company_id, :trailer_link, :ticket_link,
    show_times_attributes: [:id, :event_id, :begin_time, :end_time, :venue_id, :address, :city, :state, :zip_code, :date, :_destroy],)
  end
  # def user_params
  #   params.require(:user_info).permit(:login_token)
  # end
end
