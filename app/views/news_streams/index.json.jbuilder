json.reviews @reviews.each do |r|
  json.id r.id
  json.opinion r.opinion
  json.rating r.rating
  json.user_id r.user_id
  json.reviewee_id r.reviewee_id
  json.reviewee_type r.reviewee_type
  json.created_at r.created_at.to_date.strftime("%m/%d/%Y")
  json.display_name r.display_name
end
json.opportunities @opportunities.each do |o|
  json.id o.id
  json.company_id o.company_id
  json.venue_id o.venue_id
  json.name o.name
  json.description o.description
  json.contact_info o.contact_info
  json.created_at o.created_at.to_date.strftime("%m/%d/%Y")
end
json.performance @performances.each do |per|
  json.id per.id
  json.owner_id per.owner_id
  json.company_id per.company_id
  json.name per.name
  json.description per.description
  json.trailer_link per.trailer_link
  json.ticket_link per.ticket_link
  json.created_at per.created_at.to_date.strftime("%m/%d/%Y")
  json.genre_id per.genre_performances.each do |g|
    json.category g.genre.category
    json.genre_id g.genre_id
  end
end
json.lesson @lessons.each do |l|
  json.id l.id
  json.owner_id l.owner_id
  json.company_id l.company_id
  json.name l.name
  json.description l.description
  json.number_of_seats l.number_of_seats
  json.ticket_link l.ticket_link
  json.created_at l.created_at.to_date.strftime("%m/%d/%Y")
  json.genre_id l.genre_lessons.each do |g|
    json.category g.genre.category
    json.genre_id g.genre_id
  end
end
