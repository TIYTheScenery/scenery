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
    json.facebook_link @user.facebook_link
    json.twitter_link @user.twitter_link
    json.instagram_link @user.instagram_link
    json.youtube_link @user.youtube_link
    json.created_at @user.created_at.to_date.strftime("%m/%d/%Y")
    if @user.is_professional == true
      json.titles @user.titles.each do |u|
        json.id u.id
        json.title u.title
      end
    end
    json.reviews @user.reviews.each do |r|
      json.id r.id
      json.opinion r.opinion
      json.rating r.rating
      json.user_id r.user_id
      json.reviewee_id r.reviewee_id
      json.reviewee_type r.reviewee_type
    end
    json.companies @user.ownerships.each do |c|
      json.id c.id
      json.user_id c.user_id
      json.name c.name
      json.hero_image_url c.hero_image.url
      json.profile_image_url c.profile_image.url
      json.description c.description
      json.website_link c.website_link
      json.facebook_link c.facebook_link
      json.twitter_link c.twitter_link
      json.instagram_link c.instagram_link
      json.youtube_link c.youtube_link
      json.address c.address
      json.city c.city
      json.state c.state
      json.zip_code c.zip_code
      json.created_at c.created_at.to_date.strftime("%m/%d/%Y")
    end
  end
else
  json.errors @error
end
