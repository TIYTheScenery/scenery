json.success @success
if @success
  json.user_info do
    json.id @user.id
    json.email @user.email
    json.first_name @user.first_name
    json.last_name @user.last_name
    json.description @user.description
    json.is_professional @user.is_professional
    json.display_name @user.display_name
    json.image_url @user.profile_image.url
    json.login_token @user.login_token
    json.created_at @user.created_at.to_date.strftime("%m/%d/%Y")
    json.titles @user.titles.each do |u|
      json.title u.title
    end
  end
else
  json.errors @user.errors.full_messages
end
