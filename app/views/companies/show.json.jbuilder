json.company do
  json.id @company.id
  json.user_id @company.user_id
  json.name @company.name
  json.description @company.description
  json.website_link @company.website_link
  json.facebook_link @company.facebook_link
  json.twitter_link @company.twitter_link
  json.instagram_link @company.instagram_link
  json.youtube_link @company.youtube_link
  json.address @company.address
  json.city @company.city
  json.state @company.state
  json.zip_code @company.zip_code
  json.upcoming_performances @upcoming_performances do |up|
    json.id up.id
    json.company_id up.company_id
    json.owner_id up.owner_id
    json.name up.name
    json.description up.description
    json.trailer_link up.trailer_link
    json.ticket_link up.ticket_link
  end
  json.past_performances @past_performances do |pp|
    json.id pp.id
    json.company_id pp.company_id
    json.owner_id pp.owner_id
    json.name pp.name
    json.description pp.description
    json.trailer_link pp.trailer_link
    json.ticket_link pp.ticket_link
  end
  json.reviews @performance.reviews.each do |r|
    json.id r.id
    json.opinion s.opinion
    json.rating s.rating
    json.user_id s.user_id
    json.reviewee_id s.reviewee_id
    json.reviewee_type s.reviewee_type
  end
end
