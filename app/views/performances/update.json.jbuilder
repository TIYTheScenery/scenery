json.success @success
if @success
  json.performance do
    json.id @performance.id
    json.owner_id @performance.owner_id
    json.company_id @performance.company_id
    json.name @performance.name
    json.description @performance.description
    json.hero_image_url @performance.hero_image_url
    json.profile_image_url @performance.profile_image_url
    json.production_image_url @performance.production_image_url
    json.trailer_link @performance.trailer_link
    json.ticket_link @performance.ticket_link
    json.genre @performance.genre_performances.each do |g|
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
      json.show_date s.show_date
      json.cast_members s.cast_members.each do |cm|
        json.id cm.id
        json.name cm.name
        json.role cm.role
      end
    end
  end
else
  json.errors @performance.errors.full_messages
end
