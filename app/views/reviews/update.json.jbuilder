json.success @success
if @success
  json.review do
    json.id @review.id
    json.opinion @review.opinion
    json.rating @review.rating
    json.user_id @review.user_id
    json.reviewee_id @review.reviewee_id
    json.reviewee_type @review.reviewee_type
    json.display_name @review.display_name
    json.created_at @review.created_at.to_date.strftime("%m/%d/%Y")
  end
else
  json.errors @review.errors.full_messages
end
