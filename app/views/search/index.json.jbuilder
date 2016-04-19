json.success !@performances.empty? || !@professionals.empty? || !@companies.empty?
json.performances @performances.each do |per|
  json.id per.id
  json.owner_id per.owner_id
  json.company_id per.company_id
  json.company_name per.company.name
  json.name per.name
  json.description per.description
  json.hero_image_url per.hero_image.url
  json.trailer_link per.trailer_link
  json.ticket_link per.ticket_link
  json.created_at per.created_at.to_date.strftime("%m/%d/%Y")
end
json.professionals @professionals.each do |pro|
  json.id pro.id
  json.email pro.email
  json.first_name pro.first_name
  json.last_name pro.last_name
  json.description pro.description
  json.is_professional pro.is_professional
  json.display_name pro.display_name
  json.login_token pro.login_token
  json.facebook_link pro.facebook_link
  json.twitter_link pro.twitter_link
  json.instagram_link pro.instagram_link
  json.youtube_link pro.youtube_link
  json.created_at pro.created_at.to_date.strftime("%m/%d/%Y")
end
json.companies @companies.each do |c|
  json.id c.id
  json.user_id c.user_id
  json.name c.name
  json.description c.description
  json.hero_image_url c.hero_image.url
  json.profile_image_url c.profile_image.url
  json.website_link c.website_link
  json.facebook_link c.facebook_link
  json.twitter_link c.twitter_link
  json.instagram_link c.instagram_link
  json.youtube_link c.youtube_link
  json.address c.address
  json.city c.city
  json.state c.state
  json.zip_code c.zip_code
end
