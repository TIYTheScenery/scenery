json.array!(@reviews) do |review|
  json.extract! review, :id, :opinion, :rating, :user_id, :reviewee_id, :reviewee_type
  json.url review_url(review, format: :json)
end
