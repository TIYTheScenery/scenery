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
    json.event_id s.event_id
    json.event_type s.event_type
    json.begin_time s.begin_time
    json.end_time s.end_time
    json.venue_id s.venue_id
    json.address s.address
    json.city s.city
    json.state s.state
    json.zip_code s.zip_code
    json.show_date s.show_date
  end
  json.reviews @performance.reviews.each do |r|
    json.id r.id
    json.opinion r.opinion
    json.rating r.rating
    json.user_id r.user_id
    json.reviewee_id r.reviewee_id
    json.reviewee_type r.reviewee_type
    json.created_at r.created_at.to_date.strftime("%m/%d/%Y")
    json.display_name r.display_name
  end
end
