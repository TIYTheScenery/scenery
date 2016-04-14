class Search
  def self.performances(params)
    if params[:state] == "ZIP" then
      results = Performance.joins("JOIN genre_performances on genre_performances.performance_id = performances.id").
          where("genre_performances.genre_id = ? ", params[:genre_id]).
          joins("LEFT JOIN show_times ON performances.id = show_times.event_id").
          where("show_times.event_type = 'Performance' AND " +
              "show_times.zip_code LIKE COALESCE(?, '%')  AND " +
              "(performances.name LIKE COALESCE(?, '%') OR performances.description LIKE COALESCE(?, '%'))",
                wildcard_param(params[:city]), wildcard_param(params[:search_term]), wildcard_param(params[:search_term])).
          distinct(:performance_id)
    else
      results = Performance.joins("JOIN genre_performances on genre_performances.performance_id = performances.id").
          where("genre_performances.genre_id = ? ", params[:genre_id]).
          joins("LEFT JOIN show_times ON performances.id = show_times.event_id").
          where("show_times.event_type = 'Performance' AND " +
              "(show_times.city LIKE COALESCE(?, '%') AND show_times.state LIKE COALESCE(? , '%')) AND " +
              "(performances.name LIKE COALESCE(?, '%') OR performances.description LIKE COALESCE(?, '%'))",
                wildcard_param(params[:city]), wildcard_param(params[:state]), wildcard_param(params[:search_term]), wildcard_param(params[:search_term])).
          distinct(:performance_id)
    end
end

  def self.professionals(params)
    results = User.joins("LEFT JOIN user_titles ON user_titles.user_id = users.id").
        joins("LEFT JOIN titles on titles.id = user_titles.title_id").
        where('(LOWER(users.first_name) LIKE LOWER(?) OR LOWER(users.last_name) LIKE LOWER(?) OR LOWER(titles.title) LIKE LOWER(?) OR LOWER(users.display_name) LIKE LOWER(?)) AND users.is_professional',
          "%#{params[:search_term]}%", "%#{params[:search_term]}%", "%#{params[:search_term]}%", "%#{params[:search_term]}%").
        distinct(:user_id)
  end

  def self.companies(params)
    if params[:state] == "ZIP" then
      results = Company.where("(LOWER(name) LIKE LOWER(?) OR LOWER(description) LIKE LOWER(?)) AND zip_code == ? ",
          "%#{params[:search_term]}%", "%#{params[:search_term]}%", "#{params[:city]}")
    else
      results = Company.where("((? != '%%' AND (LOWER(name) LIKE LOWER(?) OR LOWER(description) LIKE LOWER(?))) OR ((LOWER(?) != '%%' AND LOWER(city) LIKE LOWER(?)) AND LOWER(state) LIKE LOWER(?)))",
          "%#{params[:search_term]}%", "%#{params[:search_term]}%", "%#{params[:search_term]}%", "%#{params[:city]}%", "%#{params[:city]}%", "%#{params[:state]}%")
    end
  end

  def self.wildcard_param(value)
    if value == nil or value == ""
      nil
    else
      "%" + value + "%"
    end
  end
end
