class ShowTimesController < ApplicationController
  private
    def show_time_params
      params.require(:show_time).permit(:id, :event_id, :event_type, :begin_time, :end_time, :venue_id, :address, :city, :state, :zip_code, :show_date,
        cast_members_attributes: [:id, :name, :role, :_destroy])
    end
end
