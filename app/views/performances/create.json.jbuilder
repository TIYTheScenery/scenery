json.success @success
if @success
  json.performance do
    json.id @performance.id
    json.owner_id @performance.owner_id
    json.company_id @performance.company_id
    json.name @performance.name
    json.description @performance.description
    json.trailer_link @performance.trailer_link
    json.ticket_link @performance.ticket_link
    json.genre_id @performance.genre_performances.each do |g|
      json.category g.genre.category
      json.genre_id g.genre_id
    end
    json.show_times @performance.show_times.each do |s|
      json.id s.id
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
else
  json.errors @performance.errors.full_messages
end
