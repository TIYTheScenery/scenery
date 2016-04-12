class Search
  def self.performances(params)
    if params[:city].nil? && params[:search_term].nil? then
      results = Performance.joins("JOIN genre_performances on genre_performances.performance_id = performances.id").
          where("genre_performances.genre_id = ? ", params[:genre_id]).
          distinct(:performance_id)
    else
      if params[:state] == "ZIP" then
        results = Performance.joins("JOIN genre_performances on genre_performances.performance_id = performances.id").
            where("genre_performances.genre_id = ? ", params[:genre_id]).
            joins("JOIN show_times ON performances.id = show_times.event_id").
            where("show_times.event_type = 'Performance' AND " +
                  "(? != '%%' AND ? show_times.zip_code)  OR " +
                  "((LOWER(?) != '%%' AND LOWER(?) LIKE LOWER(performances.name)) OR (LOWER(?) != '%%' AND LOWER(?) LIKE LOWER(performances.description)))",
                  "#{params[:city]}", "#{params[:city]}", "%#{params[:search_term]}%", "%#{params[:search_term]}%", "%#{params[:search_term]}%", "%#{params[:search_term]}%").
            distinct(:performance_id)
      else
        results = Performance.joins("JOIN genre_performances on genre_performances.performance_id = performances.id").
            where("genre_performances.genre_id = ? ", params[:genre_id]).
            joins("JOIN show_times ON performances.id = show_times.event_id").
            where("show_times.event_type = 'Performance' AND " +
                  "(
                  (
                    (LOWER(?) != '%%' AND LOWER(show_times.city) LIKE LOWER(?)) AND
                    (LOWER(?) != '%%' AND LOWER(show_times.state) LIKE LOWER(?))
                    )
                  OR" +
                  "(
                  (LOWER(?) != '%%' AND LOWER(performances.name) LIKE LOWER(?)) OR
                   (LOWER(?) != '%%' AND LOWER(performances.description) LIKE LOWER(?))
                   )
                   )" ,
                  "%#{params[:city]}%",  "%#{params[:city]}%", "%#{params[:state]}%", "%#{params[:state]}%", "%#{params[:search_term]}%", "%#{params[:search_term]}%", "%#{params[:search_term]}%", "%#{params[:search_term]}%").
            distinct(:performance_id)
      end
    end
  end

  def self.professionals(params)
    results = User.includes(:user_titles, :titles).where('(LOWER(users.first_name) LIKE ? OR LOWER(user.last_name) LIKE ? OR LOWER(titles.title) LIKE ? OR LOWER(user.display_name) LIKE ?) AND user.is_professional',
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
      results = Company.where("(LOWER(name) LIKE ? OR LOWER(description) LIKE ?) AND zip_code == ? ",
          "%#{params[:search_term].downcase}%", "%#{params[:search_term].downcase}%", "#{params[:city]}")
    else
      results = Company.where("(LOWER(name) LIKE ? OR LOWER(description) LIKE ?) AND LOWER(city) LIKE ?  AND LOWER(state) LIKE ?",
          "%#{params[:search_term].downcase}%", "%#{params[:search_term].downcase}%", "%#{params[:city].downcase}%", "%#{params[:state].downcase}%")
    end
  end

end
