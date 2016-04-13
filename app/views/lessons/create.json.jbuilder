json.success @success
if @success
  json.lesson do
    json.id @lesson.id
    json.owner_id @lesson.owner_id
    json.company_id @lesson.company_id
    json.name @lesson.name
    json.description @lesson.description
    json.number_of_seats @lesson.number_of_seats
    json.ticket_link @lesson.ticket_link
    json.genre_id @lesson.genre_lessons.each do |g|
      json.category g.genre.category
      json.genre_id g.genre_id
    end
    json.show_times @lesson.show_times.each do |s|
      json.id s.id
      json.begin_time s.begin_time
      json.end_time s.end_time
      json.venue_id s.venue_id
      json.address s.address
      json.city s.city
      json.state s.state
      json.zip_code s.zip_code
      json.show_date s.show_date
    end
  end
else
  json.errors @lesson.errors.full_messages
end
