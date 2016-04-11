# module Time
#   def upcoming_performance
#     upcoming_show = @company.performances.select {|c| c.show_times.last.show_date > DateTime.now}
#     upcoming_show.order(:show_date)
#     upcoming_show[0]
#   end
