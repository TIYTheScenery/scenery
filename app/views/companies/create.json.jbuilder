json.success @success
if @success
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
    json.profile_image_url @company.profile_image.url
    json.hero_image_url @company.hero_image.url
    json.reviews @company.reviews.each do |s|
      json.id s.id
      json.opinion s.opinion
      json.rating s.rating
      json.user_id s.user_id
      json.reviewee_id s.reviewee_id
      json.reviewee_type s.reviewee_type
      json.created_at s.created_at.to_date.strftime("%m/%d/%Y")
      json.display_name s.display_name
    end
    json.opportunities @company.opportunities.each do |o|
      json.id o.id
      json.company_id o.company_id
      json.venue_id o.venue_id
      json.name o.name
      json.description o.description
      json.contact_info o.contact_info
      json.created_at o.created_at.to_date.strftime("%m/%d/%Y")
    end
    json.upcoming_performances @upcoming_performances do |up|
      json.id up.id
      json.company_id up.company_id
      json.owner_id up.owner_id
      json.name up.name
      json.description up.description
      json.trailer_link up.trailer_link
      json.ticket_link up.ticket_link
      json.hero_image_url up.hero_image.url
    end
    json.past_performances @past_performances do |pp|
      json.id pp.id
      json.company_id pp.company_id
      json.owner_id pp.owner_id
      json.name pp.name
      json.description pp.description
      json.trailer_link pp.trailer_link
      json.ticket_link pp.ticket_link
      json.hero_image_url pp.hero_image.url
    end
  end
  json.user do
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
      json.titles @user.titles.each do |u|
        json.id u.id
        json.title u.title
      end
      json.reviews @user.reviews.each do |r|
        json.id r.id
        json.opinion r.opinion
        json.rating r.rating
        json.user_id r.user_id
        json.reviewee_id r.reviewee_id
        json.reviewee_type r.reviewee_type
        json.reviewee_name r.reviewee.name
        json.created_at r.created_at.to_date.strftime("%m/%d/%Y")
      end

      if @user.is_professional == true
        json.companies @companies.each do |c|
          json.id c.id
          json.user_id c.user_id
          json.name c.name
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
          json.profile_image_url c.profile_image.url
          json.hero_image_url c.hero_image.url
          json.created_at c.created_at.to_date.strftime("%m/%d/%Y")
        end
      end
    end
  end
end
else
  json.errors @company.errors.full_messages
end
