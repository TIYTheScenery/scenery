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
  json.upcoming_performance do
    json.id @performance.id
    json.company_id @performance.company_id
    json.owner_id @performance.owner_id
    json.name @performance.name
    json.description @performance.description
    json.trailer_link @performance.trailer_link
    json.ticket_link @performance.ticket_link
  end
end
