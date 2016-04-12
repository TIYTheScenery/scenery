class Search
  def self.performances(params)
    if params[:state] == "ZIP" then
      results = Performance.joins("JOIN genre_performances on genre_performances.performance_id = performances.id").
          where("genre_performances.genre_id = ? ", params[:genre_id]).
          joins("JOIN show_times ON performances.id = show_times.event_id").
          where("show_times.event_type = 'Performance' AND " +
                "show_times.zip_code LIKE ? AND " +
                "(LOWER(performances.name) LIKE LOWER(?) OR LOWER(performances.description) LIKE LOWER(?) )",
                "%#{params[:city]}%", "%#{params[:search_term]}%", "%#{params[:search_term]}%" ).
          distinct(:performance_id)
    else
      results = Performance.joins("JOIN genre_performances on genre_performances.performance_id = performances.id").
          where("genre_performances.genre_id = ? ", params[:genre_id]).
          joins("JOIN show_times ON performances.id = show_times.event_id").
          where("show_times.event_type = 'Performance' AND " +
                  "(LOWER(show_times.city) LIKE LOWER(?) AND LOWER(show_times.state) LIKE LOWER(?) ) AND" +
                "(LOWER(performances.name) LIKE LOWER(?) OR LOWER(performances.description) LIKE LOWER(?) )",
              "%#{params[:city]}%", "%#{params[:state]}%", "%#{params[:search_term]}%", "%#{params[:search_term]}%" ).
          distinct(:performance_id)
    end
  end

  def self.professionals(params)
    results = Users.includes(:user_titles, :titles).where('(LOWER(users.first_name) LIKE ? OR LOWER(user.last_name) LIKE ? OR LOWER(titles.title) LIKE ? OR LOWER(user.display_name) LIKE ?) AND user.is_professional',
        "%#{params[:search_term].downcase}%", "%#{params[:search_term].downcase}%", "%#{params[:search_term].downcase}%", "%#{params[:search_term].downcase}%")
    # save for when users finally have a location
    # if params[:state] == "ZIP" then
    #
    # else
    #
    # end
  end

  def self.companies(params)
    if params[:state] == "ZIP" then

    else

    end
  end

end
