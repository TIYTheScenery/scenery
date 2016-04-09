json.success true
json.performances @performances.each do |per|
  json.id per.id
  json.owner_id per.owner_id
  json.company_id per.company_id
  json.name per.name
  json.description per.description
  json.trailer_link per.trailer_link
  json.ticket_link per.ticket_link
  json.genre_id @performance.genre_performances.each do |g|
    json.category g.genre.category
    json.genre_id g.genre_id
  end
  json.show_times @performance.show_times.each do |s|
    json.begin_time s.begin_time
    json.end_time s.end_time
    json.venue_id s.venue_id
    json.address s.address
    json.city s.city
    json.state s.state
    json.zip_code s.zip_code
    json.date s.date
  end
end
