class SearchController < ApplicationController
  def index
  end

  private def search_params
    params.require(:search_info).permit(:search_term, :genre_id, :location)
  end
end
