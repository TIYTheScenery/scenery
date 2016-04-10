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
  json.performances @company.performances.each do |c|
    json.id c.id
    json.company_id c.company_id
    json.owner_id c.owner_id
    json.name c.name
    json.description c.description
    json.trailer_link c.trailer_link
    json.ticket_link c.ticket_link
  end
end
