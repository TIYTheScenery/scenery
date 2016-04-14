class Search
  def self.performances(params)
    results = Performance.joins("JOIN genre_performances on genre_performances.performance_id = performances.id").
        where("genre_performances.genre_id = ? ", params[:genre_id]).
        joins("LEFT JOIN show_times ON performances.id = show_times.event_id").
        where("show_times.event_type = 'Performance' AND " +
            "(performances.name LIKE COALESCE(?, '%') OR performances.description LIKE COALESCE(?, '%'))",
            wildcard_param(params[:search_term]), wildcard_param(params[:search_term]))

    if params[:state] == "ZIP"
      results = results.where("show_times.zip_code LIKE COALESCE(?, '%')",wildcard_param(params[:city]))
    else
      results = results.where("show_times.city LIKE COALESCE(?, '%') AND show_times.state LIKE COALESCE(? , '%')",wildcard_param(params[:city]),wildcard_param(params[:state]))
    end

    results.distinct(:performance_id)
end

  def self.professionals(params)
    results = User.where("(users.first_name LIKE COALESCE(?, '%') OR users.last_name LIKE COALESCE(?, '%') OR users.display_name LIKE COALESCE(?, '%')) AND users.is_professional",
        wildcard_param(params[:search_term]), wildcard_param(params[:search_term]), wildcard_param(params[:search_term]))
    # results = User.joins("LEFT JOIN user_titles ON user_titles.user_id = users.id").
    #     joins("JOIN titles on titles.id = user_titles.title_id").
    #     where("(titles.title LIKE COALESCE(?, '%') OR titles.title IS NULL)",
    #       wildcard_param(params[:search_term]))
    # results.distinct(:user_id)
  end

  def self.companies(params)
    results = Company.where("name LIKE COALESCE(?, '%') OR description LIKE COALESCE(?, '%')", wildcard_param(params[:search_term]), wildcard_param(params[:search_term]))

    if params[:state] == "ZIP" then
      results = results.where("zip_code LIKE COALESCE(?, '%')", wildcard_param(params[:city]))
    else
      results = results.where("city LIKE COALESCE(?, '%') AND state LIKE COALESCE(? , '%')", wildcard_param(params[:city]), wildcard_param(params[:state]))
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
