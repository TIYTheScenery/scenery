json.review do
  json.id @review.id
  json.opinion @review.opinion
  json.rating @review.rating
  json.user_id @review.user_id
  json.reviewee_id @review.reviewee_id
  json.reviewee_type @review.reviewee_type
end
