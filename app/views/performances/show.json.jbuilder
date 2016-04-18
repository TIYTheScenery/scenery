json.performance do
  json.id @performance.id
  json.owner_id @performance.owner_id
  json.image_url @performance.company.user.image_url
  json.company_id @performance.company_id
  json.company_name @performance.company.name
  json.name @performance.name
  json.description @performance.description
  json.hero_image_url @performance.hero_image_url
  json.profile_image_url @performance.profile_image_url
  json.production_image_url @performance.production_image_url
  json.trailer_link @performance.trailer_link
  json.ticket_link @performance.ticket_link
  json.genre_id @performance.genre_performances.each do |g|
    json.id g.id
    json.category g.genre.category
    json.genre_id g.genre_id
  end
  json.show_times @performance.show_times.each do |s|
    json.id s.id
    json.event_id s.event_id
    json.event_type s.event_type
    json.begin_time s.begin_time.localtime.strftime("%l:%M")
    json.venue_id s.venue_id
    json.address s.address
    json.city s.city
    json.state s.state
    json.zip_code s.zip_code
    json.show_date s.show_date.to_date.strftime("%m/%d/%Y")
    json.cast_members s.cast_members.each do |cm|
      json.id cm.id
      json.name cm.name
      json.role cm.role
    end
  end
  json.reviews @performance.reviews.each do |r|
    json.id r.id
    json.opinion r.opinion
    json.rating r.rating
    json.image_url s.user.image_url
    json.reviewee_name s.reviewee.name
    json.user_id r.user_id
    json.reviewee_id r.reviewee_id
    json.reviewee_type r.reviewee_type
    json.created_at r.created_at.to_date.strftime("%m/%d/%Y")
    json.display_name r.display_name
  end
end
