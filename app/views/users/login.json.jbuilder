json.success @success
if @success
  json.user_info do
    json.email @user.email
    json.first_name @user.first_name
    json.last_name @user.last_name
    json.description @user.description
    json.is_professional @user.is_professional
    json.display_name @user.display_name
    json.login_token @user.login_token
  end
else
  json.errors @error
end
