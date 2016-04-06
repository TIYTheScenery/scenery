class SearchController < ApplicationController
  def index
    location = search_params[:location].split(',').map(&:strip)
    location << 0 if location.length == 1
    performances = Performance.joins("JOIN genres_performances on genres_performances.performance_id = performances.id").
        where("genres_performances.genre_id = ?", search_params[:genre_id]).
        joins("JOIN show_times ON performances.id = show_times.event_id").
        where("show_times.event_type = 'Performance' AND (show_times.address LIKE ? OR (show_times.city LIKE ? AND show_times.state LIKE ? ) OR show_times.zip_code LIKE ? ) AND (performances.name LIKE ? OR performances.description LIKE ? )",
            "%#{location[0]}%", "%#{location[0]}%", "%#{location[1]}%", "%#{location[0]}%", "%#{search_params[:search_term]}%", "%#{search_params[:search_term]}%" )
    byebug
  end

  private def search_params
    params.require(:search_info).permit(:search_term, :genre_id, :location)
  end
end
