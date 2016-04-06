class SearchController < ApplicationController
  def index
    location = params[:location].split(',').map(&:strip)
    location << 0 if location.length == 1
    @performances = Performance.joins("JOIN genre_performances on genre_performances.performance_id = performances.id").
        where("genre_performances.genre_id = ?", params[:genre_id]).
        joins("JOIN show_times ON performances.id = show_times.event_id").
        where("((show_times.event_type = 'Performance' AND (show_times.address LIKE ? OR (show_times.city LIKE ? AND show_times.state LIKE ? ) OR show_times.zip_code LIKE ? )) OR (performances.name LIKE ? OR performances.description LIKE ? ))",
            "%#{location[0]}%", "%#{location[0]}%", "%#{location[1]}%", "%#{location[0]}%", "%#{params[:search_term]}%", "%#{params[:search_term]}%" )
  end

  private def search_params
    params.require(:search_info).permit(:search_term, :genre_id, :location)
  end
end
