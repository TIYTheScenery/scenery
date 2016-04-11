
json.user_info do
  json.email @user.email
  json.first_name @user.first_name
  json.last_name @user.last_name
  json.description @user.description
  json.is_professional @user.is_professional
  json.display_name @user.display_name
  json.login_token @user.login_token
  json.facebook_link @user.facebook_link
  json.twitter_link @user.twitter_link
  json.instagram_link @user.instagram_link
  json.youtube_link @user.youtube_link
  json.created_at @user.created_at.to_date.strftime("%m/%d/%Y")
  json.titles @user.titles.each do |u|
    json.title u.title
  end
end
