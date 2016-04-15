json.users @users.each do |c|
  json.id c.id
  json.email c.email
  json.first_name c.first_name
  json.last_name c.last_name
  json.description c.description
  json.is_professional c.is_professional
  json.display_name c.display_name
  json.image_url c.image_url
  json.login_token c.login_token
  json.facebook_link c.facebook_link
  json.twitter_link c.twitter_link
  json.instagram_link c.instagram_link
  json.youtube_link c.youtube_link
  json.image_url c.image_url
  json.created_at c.created_at.to_date.strftime("%m/%d/%Y")

end
